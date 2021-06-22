//
//  CustomCell.swift
//  GamesCatalog
//
//  Created by Tsuprik Olga on 18.06.21.
//

import UIKit

class GameCell: UITableViewCell {
    // MARK: IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func set(name: String, description: Double) {
        self.nameLabel.text = name
        self.ratingLabel.text = String(description)
    }

}
