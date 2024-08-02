//
//  HomeView.swift
//  Bass Spotter
//
//  Created by Phillip on 30.07.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    
    @StateObject private var locationModel = LocationsModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .environmentObject(locationModel)
                .tabItem {
                    Label {
                        Text("Explore")
                    } icon: {
                        Image("fish")
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == 0 ? .blue : .gray)
                    }
                }
                .tag(0)
            
            FavoritesView()
                .environmentObject(locationModel)
                .tabItem {
                    Label {
                        Text("Favorites")
                    } icon: {
                        Image("heartt")
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == 0 ? .blue : .gray)
                    }
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label {
                        Text("Settings")
                    } icon: {
                        Image("gear")
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == 0 ? .blue : .gray)
                    }
                }
                .tag(2)
        }
        .accentColor(.customBlue)
    }
}

#Preview {
    HomeView()
}
