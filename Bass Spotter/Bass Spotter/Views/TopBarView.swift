//
//  TopBarView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct TopBarView: View {
    @State var tab: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(tab)
                    .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
                
                Spacer()
                
                HStack {
                    Image("Location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .offset(x: 3)
                    
                    Text("Toronto, Canada")
                        .foregroundColor(.customBlue)
                        .font(.custom("PlusJakartaSans-VariableFont_wght", size: 12))
                        .padding(.trailing, 3)
                }
                .padding(4)
                .background(
                    Rectangle()
                        .foregroundColor(.customLightBlue)
                        .cornerRadius(32)
                )
            }
            
            Rectangle()
                .frame(height: 1)
                .padding(.bottom)
                .foregroundColor(.black.opacity(0.05))
                .padding(.horizontal, -16)
        }
    }
}

#Preview {
    TopBarView(tab: "Temp")
}
