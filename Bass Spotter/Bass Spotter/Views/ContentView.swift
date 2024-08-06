//
//  ContentView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI
import OneSignalFramework

struct ContentView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    @State private var showLoadingView = true
    @State private var isNotificationsAllowed: Bool = false
    @State private var isTrackingAllowed: Bool = false
    @State private var isWebView: Bool = false
    @State private var url: URL? = URL(string: Constants.webViewURL)
    @State private var urlStatus: Int? = nil

    var body: some View {
        VStack {
            if showLoadingView {
            LoadingView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        requestPermissions()
                    }
                }
        } else {
            if isNotificationsAllowed && isTrackingAllowed {
                if let url = url, urlStatus == 200 {
                    WebView(urlString: url)
                } else {
                    if onboardingViewModel.hasCompletedOnboarding {
                        HomeView()
                    } else {
                        OnboardingView(onboardingViewModel: onboardingViewModel)
                    }
                }
            } else {
                if onboardingViewModel.hasCompletedOnboarding {
                    HomeView()
                } else {
                    OnboardingView(onboardingViewModel: onboardingViewModel)
                }
            }
        }
    }
    .onAppear {
        if let url = url {
            URLHandler.checkURLStatus(url: url) { isSuccess, updatedURL, status in
                print("URL check completed. Success: \(isSuccess), Status: \(String(describing: status))")
                self.urlStatus = status
                if isSuccess, let updatedURL = updatedURL {
                    self.url = updatedURL
                    
                    print("DEBUG: updatedURL = \(updatedURL)")
                }
            }
        }
    }
}
    
    private func requestPermissions() {
        OnesignalPush.initPush { status in
            self.isTrackingAllowed = (status == .authorized)
            self.isNotificationsAllowed = OneSignal.Notifications.permission
            
            self.isWebView = true
            self.showLoadingView = false
        }
    }
}

#Preview {
    ContentView()
}
