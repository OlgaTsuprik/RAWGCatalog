//
//  GameModel.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let count: Int
    let next, previous: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let slug, name, released: String
    let tba: Bool
    let backgroundImage: String
    let rating, ratingTop: Int
    let ratingsCount: Int
    let reviewsTextCount: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
    }
}

