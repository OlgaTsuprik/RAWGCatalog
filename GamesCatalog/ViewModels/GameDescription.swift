//
//  GameDescription.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 21.06.21.
//

import Foundation

struct GameDescription {
    var descriprion: String
}

struct GamesList {
    let gamesList: [GameDescription]
    
    init(game: Welcome) {
        gamesList = game.results.map {
            return GameDescription(descriprion: $0.reviewsTextCount)
        }
    }
}
