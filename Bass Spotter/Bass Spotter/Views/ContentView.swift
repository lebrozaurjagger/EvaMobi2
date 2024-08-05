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

    var body: some View {
        Group {
            if showLoadingView {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            requestPermissions()
                        }
                    }
            } else {
                if isNotificationsAllowed && isTrackingAllowed {
                    ExactWebView()
                } else {
                    if onboardingViewModel.hasCompletedOnboarding {
                        HomeView()
                    } else {
                        OnboardingView(onboardingViewModel: onboardingViewModel)
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
