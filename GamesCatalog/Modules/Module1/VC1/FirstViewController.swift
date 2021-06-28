//
//  FirstViewController.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var networkingManager = NetworkingManager()
    var games: [vmGameDescription] = []
    var isLoadingList: Bool = false
    
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
    
    // MARK: Methods
    func loadMoreItemsForList(){
        if networkingManager.isLoadingList == false {
            networkingManager.pageNumber += 1
        }
        networkingManager.fetchGames { [weak self] data in
            self?.games.append(contentsOf: data.gamesList)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        if let cell = cell as? GameCell {
            let game = games[indexPath.row]
            cell.mvvmViewModel = game
            cell.indexLabel.text = String(indexPath.row + 1)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.loadMoreItemsForList()
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height) && !networkingManager.isLoadingList {
            networkingManager.isLoadingList = true
            self.loadMoreItemsForList()
        }
    }
}
