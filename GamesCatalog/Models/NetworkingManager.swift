//
//  NetworkingManager.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import Foundation


class NetworkingManager {
    let baseURL = "https://api.rawg.io/docs/#operation/games_list"
    //let baseURL = "https://api.rawg.io/api/games"
    func fetchGames(completion: @escaping ([Result]?) -> Void) {
       // guard let urlString =  URL(string: baseURL + "?key=" + apiKey) else {
        guard let urlString =  URL(string: baseURL) else {
            
            return
        }
        print(urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else {return}
            print("??????")
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
    
    
    
//    private func decodeGameListJson(data: Data) -> [Result]? {
//            let decoder = JSONDecoder()
//            do {
//                let games = try decoder.decode([Result].self, from: data)
//                return games
//            } catch let error {
//                print("Decode List Error " + error.localizedDescription)
//                return nil
//            }
//        }
}
