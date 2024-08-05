//
//  ContentView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI
import UserNotifications
import AppTrackingTransparency

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
                            requestNotificationPermission()
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
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                self.isNotificationsAllowed = granted
                self.requestTrackingPermission()
            }
        }
    }
    
    func requestTrackingPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async {
                    self.isTrackingAllowed = (status == .authorized)
                    self.isWebView = true
                    self.showLoadingView = false
                }
            }
        } else {
            self.isTrackingAllowed = true
            self.isWebView = true
            self.showLoadingView = false
        }
    }
}

#Preview {
    ContentView()
}
