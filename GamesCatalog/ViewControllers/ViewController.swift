//
//  ViewController.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var networkingManager = NetworkingManager()
//    var games: [GameDescription] = [] {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
    
    var games: [GameDescription] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.networkingManager.fetchGames { [weak self] data in
            DispatchQueue.main.async {
                self?.games = data.gamesList
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        if let cell = cell as? GameCell {
            let game = games[indexPath.row]
            cell.set(name: games[indexPath.row].name, description: games[indexPath.row].rating)
        }
        cell.selectionStyle = .none
        return cell
    }
}
