//
//  GameModel.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import Foundation

// MARK: - Welcome
struct ListOfGames: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Game]
}

// MARK: - Result
struct Game: Codable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int

    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
    }
}

