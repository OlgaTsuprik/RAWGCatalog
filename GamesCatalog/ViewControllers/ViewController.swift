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

extension ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let position = scrollView.contentOffset.y
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height) {
//        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            networkingManager.fetchGames { [weak self] data in
                self?.games.append(contentsOf: data.gamesList)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    
                }
            }
            print("added")
            print(games.count)
        }
        
    }
}
