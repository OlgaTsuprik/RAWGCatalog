//
//  NetworkingManager.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import Foundation


class NetworkingManager {
    // MARK: Properties
    let baseURL = "https://api.rawg.io/docs/#operation/games_list"
    
    // MARK: Methods
    func fetchGames(completion: @escaping ([Result]?) -> Void) {
        guard let urlString =  URL(string: baseURL) else {
            return
        }
        print(urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {return}
            print(data)
            do {
                let singleGames = try? JSONDecoder().decode([Result].self, from: data)
                print(data.description)
                completion(singleGames)
            }
            catch let error {
                print(error.localizedDescription)
            }
        }.resume()
   }
}
