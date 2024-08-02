//
//  SettingsView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI
import WebKit
import StoreKit

struct SettingsView: View {
    @State private var isShareSheetPresented = false
    @State private var isPrivacySheetPresented = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(.secondarySystemBackground))
            
            VStack(alignment: .leading) {
                TopBarView(tab: "Settings")
                
                VStack(alignment: .leading, spacing: 32) {
                    Button {
                        isShareSheetPresented = true
                    } label: {
                        StackCell(icon: "Send", name: "Share App")
                    }
                    .sheet(isPresented: $isShareSheetPresented) {
                        ShareSheet(activityItems: ["Share our app to your friends!"])
                    }
                    
                    Button {
                        requestReview()
                    } label: {
                        StackCell(icon: "Shield", name: "Rate Us")
                    }
                    
                    Button {
                        isPrivacySheetPresented = true
                    } label: {
                        StackCell(icon: "Star", name: "Privacy Policy")
                    }
                    .sheet(isPresented: $isPrivacySheetPresented) {
                        WebView(urlString: "https://www.example.com")
                    }
                }
                .foregroundColor(.black)
            }
            .padding()
            
            Spacer()
        }
    }
    
    func requestReview() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}

#Preview {
    SettingsView()
}

struct StackCell: View {
    @State var icon: String
    @State var name: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .background(
                    Rectangle()
                        .foregroundColor(.customLightBlue)
                        .frame(width: 24, height: 24)
                        .cornerRadius(16)
                        .foregroundColor(.blue)
                )
            
            Text(name)
                .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
