//
//  GameDescription.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 21.06.21.
//

import Foundation


struct GameDescription: Codable {
    var name: String
    var rating: Double
    var slug: String
}

struct GamesList {
    var count: Int
    var gamesList: [GameDescription]
    
    init?(data: ListOfGames) {
        count = data.count
        gamesList = data.results.map {
            return GameDescription(name: $0.name, rating: $0.rating, slug: $0.slug)
        }
    }
}

