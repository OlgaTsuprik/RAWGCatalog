//
//  CustomCell.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import UIKit

class GameCell: UITableViewCell {
    // MARK: IBOutlets
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: Methods
    func set(index: Int, name: String, rating: Double) {
        self.indexLabel.text = String(index)
        self.nameLabel.text = name
        self.ratingLabel.text = String(rating)
    }

}
