//
//  NetworkingManager.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import Foundation

class NetworkingManager {
    // MARK: Properties
    let baseURL = "https://api.rawg.io/api/games"
    var pageNumber: Int = 1
    var isLoadingList: Bool = false
    
    // MARK: Methods
    func fetchGames(completion: @escaping (GamesList) -> Void) {
        self.isLoadingList = false
        guard let urlString =  URL(string: baseURL + "?key=" + Constants.apiKey.rawValue + "&page=" + String(pageNumber)) else {
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let gamesData = try decoder.decode(ListOfGames.self, from: data)
                    if let games = GamesList(data: gamesData) {
                        completion(games)
                    }
                }
                catch let error as NSError {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
