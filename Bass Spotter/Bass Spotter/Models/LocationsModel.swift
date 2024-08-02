//
//  LocationsModel.swift
//  Bass Spotter
//
//  Created by Phillip on 30.07.2024.
//

import SwiftUI

struct Location: Identifiable, Codable {
    var id = UUID()
    var title: String
    var address: String
    var fishingSeason: String
    var description: String
    var imageName: String
    var countOfSpecies: Int
    var isFav: Bool
    
    var bass: Bool
    var pike: Bool
    var walleye: Bool
    var carp: Bool
    var trout: Bool
    var salmon: Bool
}

class LocationsModel: ObservableObject {
    @Published var locations: [Location] {
        didSet {
            saveLocations()
        }
    }
    
    init() {
        self.locations = LocationsModel.loadLocations()
    }
    
    func toggleFavorite(for location: Location) {
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index].isFav.toggle()
        }
    }
    
    private func saveLocations() {
        if let encodedData = try? JSONEncoder().encode(locations) {
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsKeys.universalKey)
        }
    }
    
    private static func loadLocations() -> [Location] {
        if let savedData = UserDefaults.standard.data(forKey: UserDefaultsKeys.universalKey),
           let decodedData = try? JSONDecoder().decode([Location].self, from: savedData) {
            return decodedData
        }
        return [
            Location(title: "Ontario Lake",
                     address: "Toronto Waterfront, Toronto, ON",
                     fishingSeason: "May-Oct",
                     description: "One of the Great Lakes, Lake Ontario offers vast fishing opportunities. The Toronto waterfront is a popular spot, providing beautiful views of the city skyline while you fish.",
                     imageName: "1",
                     countOfSpecies: 4,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: true,
                     carp: false,
                     trout: true,
                     salmon: true),
            
            Location(title: "Toronto Islands",
                     address: " Toronto Islands, Toronto, ON",
                     fishingSeason: "Year-round",
                     description: "Accessible by ferry, the Toronto Islands provide a tranquil fishing experience away from the city buzz. The lagoons and surrounding waters are ideal for pike, bass, and carp fishing.",
                     imageName: "2",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: true,
                     walleye: true,
                     carp: false,
                     trout: false,
                     salmon: false),
            
            Location(title: "Humber River",
                     address: "Alongside Humber River, Toronto, ON",
                     fishingSeason: "Apr-Oct",
                     description: "The Humber River runs through Toronto and offers excellent fishing spots along its course. It’s particularly known for its spring and fall salmon and trout runs.",
                     imageName: "3",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: true),
            
            Location(title: "Grenadier Pond",
                     address: "High Park, 1873 Bloor St W, Toronto, ON M6R 2Z3",
                     fishingSeason: "Year-round",
                     description: "Located within High Park, Grenadier Pond is a serene fishing spot perfect for a family outing. It's a popular location for catching bass, carp, and pike.",
                     imageName: "4",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: true,
                     walleye: false,
                     carp: true,
                     trout: false,
                     salmon: false),
            
            Location(title: "Rouge River",
                     address: "Rouge National Urban Park, Toronto, ON",
                     fishingSeason: "Apr-Oct",
                     description: "Rouge River, part of the Rouge National Urban Park, offers a picturesque setting for fishing. It's renowned for salmon and trout fishing, especially during migration seasons",
                     imageName: "5",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: true),
            
            Location(title: "Don River",
                     address: "Alongside Don River, Toronto, ON",
                     fishingSeason: "Year-round",
                     description: "The Don River flows through the heart of Toronto, providing convenient fishing spots within the city. It’s a great spot for urban anglers looking to catch trout and bass.",
                     imageName: "6",
                     countOfSpecies: 2,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: false),
            
            Location(title: "Bluffer's Park",
                     address: "1 Brimley Rd S, Scarborough, ON M1M 3W3",
                     fishingSeason: "May-Oct",
                     description: "Located at the base of the Scarborough Bluffs, Bluffer’s Park offers scenic fishing opportunities with the potential to catch salmon, trout, and bass.",
                     imageName: "7",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: true),
            
            Location(title: "Toronto Harbour",
                     address: "Toronto Harbourfront, Toronto, ON",
                     fishingSeason: "Year-round",
                     description: "The harbour area provides accessible fishing spots along the waterfront, with the chance to catch a variety of fish including salmon, trout, bass, and carp.",
                     imageName: "8",
                     countOfSpecies: 4,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: true,
                     trout: true,
                     salmon: true),
            
            Location(title: "Etobicoke Creek",
                     address: "Alongside Etobicoke Creek, Toronto, ON",
                     fishingSeason: "Year-round",
                     description: "Etobicoke Creek runs through the western part of Toronto and offers quiet fishing spots away from the urban hustle. It's known for trout, bass, and pike fishing",
                     imageName: "9",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: true,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: false),
            
            Location(title: "Highland Creek",
                     address: "Alongside Highland Creek, Toronto, ON",
                     fishingSeason: "Apr-Oct",
                     description: "Highland Creek, located in the eastern part of Toronto, provides excellent fishing opportunities. The creek is especially popular during salmon and trout migration seasons.",
                     imageName: "10",
                     countOfSpecies: 3,
                     isFav: false,
                     
                     bass: true,
                     pike: false,
                     walleye: false,
                     carp: false,
                     trout: true,
                     salmon: true)
        ]
    }
}
