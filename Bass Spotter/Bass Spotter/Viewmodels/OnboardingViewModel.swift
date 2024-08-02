//
//  OnboardingViewModel.swift
//  Bass Spotter
//
//  Created by Phillip on 30.07.2024.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var hasCompletedOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(hasCompletedOnboarding, forKey: UserDefaultsKeys.universalKey)
        }
    }
    
    init() {
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: UserDefaultsKeys.universalKey)
    }
}
