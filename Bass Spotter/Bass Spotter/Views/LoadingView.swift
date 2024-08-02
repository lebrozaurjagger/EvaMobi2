//
//  LoadingView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: -80)
            
            VStack {
                Spacer()
                
                ProgressView("Loading, please wait...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .foregroundColor(.customBlue.opacity(0.5))
                    .font(.system(size: 14))
            }
            .padding(.bottom, 64)
        }
    }
}

#Preview {
    LoadingView()
}
