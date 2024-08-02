//
//  ExploreView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var selectedButton: Int = 0
    @EnvironmentObject var locationModel: LocationsModel
    
    private let buttonTitles = ["All", "Bass", "Pike", "Walleye", "Carp", "Trout", "Salmon"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color(.secondarySystemBackground))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        TopBarView(tab: "Explore fishing ponds")
                        
                        Text("Fish species")
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 24))
                            .padding(.bottom)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<buttonTitles.count, id: \.self) { index in
                                    Button {
                                        withAnimation {
                                            selectedButton = index
                                        }
                                    } label: {
                                        FilterSpecies(name: buttonTitles[index], image: buttonTitles[index].lowercased())
                                            .background(selectedButton == index ? Color.white : Color.clear)
                                            .cornerRadius(24)
                                            .shadow(color: selectedButton == index ? .customBlue : .clear, radius: 1)
                                            .padding(.horizontal, 4)
                                            .padding(.vertical, selectedButton == index ? 2 : 0)
                                    }
                                    .shadow(color: selectedButton == index ? .customBlue : .clear, radius: 1)
                                }
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                        }
                        .padding(.horizontal, -16)
                        
                        Text("Fishing ponds")
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 24))
                            .padding(.top, 32)
                        
                        contentForSelectedButton()
                            .foregroundColor(.black)
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    private func contentForSelectedButton() -> some View {
        let filteredLocations: [Location] = {
            switch selectedButton {
            case 1: return locationModel.locations.filter { $0.bass }
            case 2: return locationModel.locations.filter { $0.pike }
            case 3: return locationModel.locations.filter { $0.walleye }
            case 4: return locationModel.locations.filter { $0.carp }
            case 5: return locationModel.locations.filter { $0.trout }
            case 6: return locationModel.locations.filter { $0.salmon }
            default: return locationModel.locations
            }
        }()
        
        ForEach(filteredLocations) { location in
            if let index = locationModel.locations.firstIndex(where: { $0.id == location.id }) {
                NavigationLink(destination: LocationView(location: $locationModel.locations[index])) {
                    CardView(location: $locationModel.locations[index])
                }
            }
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(LocationsModel())
}

struct FilterSpecies: View {
    @State var name: String
    @State var image: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 4)
                .frame(width: 90, height: 100)
                .cornerRadius(24)
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                Text(name)
                    .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
            }
        }
    }
}
