
//
//  LocationView.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var locationModel: LocationsModel
    @Binding var location: Location
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isExpanded: Bool = false
    private let lineLimit: Int = 3
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(.secondarySystemBackground))
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Button {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.white)
                                
                                Image("arrow-down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                locationModel.toggleFavorite(for: location)
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.white)
                                
                                Image(location.isFav == true ? "heart" : "heartempty")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 240)
                        .background(
                            Image(location.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 240)
                                .clipped()
                        )
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(location.title)
                                .font(.custom("PlusJakartaSans-VariableFont_wght", size: 32))
                            
                            Spacer()
                            
                            HStack {
                                Image("ion_fish")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                
                                Text(String(location.countOfSpecies))
                                    .foregroundColor(.customBlue)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(
                                Rectangle()
                                    .cornerRadius(16)
                                    .foregroundColor(.customLightBlue)
                            )
                        }
                        
                        HStack {
                            Image("Location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text(location.address)
                                .font(.custom("PlusJakartaSans-VariableFont_wght", size: 14))
                                .foregroundColor(.customBlue)
                        }
                        
                        Text("Fishes found")
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 24))
                            .padding(.vertical)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                if location.bass {
                                    FilterSpecies(name: "Bass", image: "bass")
                                }
                                if location.pike {
                                    FilterSpecies(name: "Pike", image: "pike")
                                }
                                if location.walleye {
                                    FilterSpecies(name: "Walleye", image: "walleye")
                                }
                                if location.carp {
                                    FilterSpecies(name: "Carp", image: "carp")
                                }
                                if location.trout {
                                    FilterSpecies(name: "Trout", image: "trout")
                                }
                                if location.salmon {
                                    FilterSpecies(name: "Salmon", image: "salmon")
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.horizontal, -16)
                        
                        Text("Description")
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 24))
                            .padding(.top, 16)
                            .padding(.bottom, 4)
                        
                        Text(location.description)
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
                            .lineLimit(isExpanded ? nil : lineLimit)
                            .animation(.easeOut, value: isExpanded)
                        
                        Button {
                            isExpanded.toggle()
                        } label: {
                            Text(isExpanded ? "Show Less" : "Show More")
                                .foregroundColor(.customBlue)
                        }
                        
                        Text("Hot seasons")
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 24))
                            .padding(.top, 16)
                            .padding(.bottom, 4)
                        
                        Text(location.fishingSeason)
                            .font(.custom("PlusJakartaSans-VariableFont_wght", size: 16))
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExploreView()
        .environmentObject(LocationsModel())
}
