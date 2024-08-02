//
//  ContentView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    @State private var showLoadingView = true

    var body: some View {
        Group {
            if showLoadingView {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.showLoadingView = false
                            }
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
}

#Preview {
    ContentView()
}
