//
//  FavoritesView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var locationModel: LocationsModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color(.secondarySystemBackground))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        TopBarView(tab: "Favorites")
                        
                        ZStack(alignment: .top) {
                            let favoriteLocations = locationModel.locations.filter { $0.isFav }
                            
                            if favoriteLocations.isEmpty {
                                Text("No favorites yet")
                                    .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
                                    .padding(10)
                                    .background(
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                    )
                                    .padding(.top, 300)
                            } else {
                                VStack {
                                    ForEach(favoriteLocations) { location in
                                        if let index = locationModel.locations.firstIndex(where: { $0.id == location.id }) {
                                            NavigationLink(destination: LocationView(location: $locationModel.locations[index])) {
                                                CardView(location: $locationModel.locations[index])
                                            }
                                        }
                                    }
                                }
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
