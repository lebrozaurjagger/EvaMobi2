//
//  OnboardingView.swift
//  Bass Spotter
//
//  Created by Phillip on 30.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var onboardingViewModel: OnboardingViewModel
    
    @State var counter: Int = 0
    
    var imageName: String {
        switch counter {
        case 0:
            return "onboarding1"
        case 1:
            return "onboarding2"
        case 2:
            return "onboarding3"
        default:
            return ""
        }
    }
    var title: String {
        switch counter {
        case 0:
            return "Discover Prime Fishing Spots"
        case 1:
            return "Filter by Fish Type"
        case 2:
            return "Plan Your Perfect Fishing Trip"
        default:
            return "Error Temp Message"
        }
    }
    var description: String {
        switch counter {
        case 0:
            return "Find the best fishing locations around Toronto with just a few taps. Explore top spots curated for your perfect catch."
        case 1:
            return "Specify your target fish and get tailored recommendations. Whether it's bass, trout, or salmon, we've got you covered."
        case 2:
            return "Use our app to plan your fishing adventures with ease. Get detailed information on each location and make the most of your fishing experience."
        default:
            return "Error Temp Message"
        }
    }
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .ignoresSafeArea()
                
            VStack {
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                counter = 0
                                onboardingViewModel.hasCompletedOnboarding = true
                            }
                        } label: {
                            Text("Skip")
                                .foregroundColor(.white)
                                .font(.custom("PlusJakartaSans-VariableFont_wght", size: 14))
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0.3))
                                        .cornerRadius(20)
                                )
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                    Text(title)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.white)
                        .padding(.bottom, 16)
                    
                    Text(description)
                        .multilineTextAlignment(.center)
                        .font(.custom("PlusJakartaSans-VariableFont_wght", size: 14))
                        .foregroundColor(.white)
                        .padding(.bottom, 16)
                    
                    HStack {
                        Rectangle()
                            .frame(width: 28, height: 4)
                            .cornerRadius(2)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 28, height: 4)
                            .cornerRadius(2)
                            .foregroundColor(counter == 1 || counter == 2 ? .white : .white.opacity(0.27))
                        Rectangle()
                            .frame(width: 28, height: 4)
                            .cornerRadius(2)
                            .foregroundColor(counter == 2 ? .white : .white.opacity(0.27))
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                counter += 1
                                
                                if counter == 3 {
                                    counter = 0
                                    onboardingViewModel.hasCompletedOnboarding = true
                                }
                            }
                        } label: {
                            Image("arrow-down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33, height: 33)
                                .scaleEffect(x: -1, y: 1, anchor: .center)
                                .background(
                                    Rectangle()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(22)
                                        .foregroundColor(.white)
                                )
                        }

                    }
                }
                .padding()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
