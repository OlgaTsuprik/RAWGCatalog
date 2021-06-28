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
    
    // MARK: Properties
    var mvvmViewModel: vmGameDescription? {
        didSet {
            if let mvvmVM = mvvmViewModel {
                self.nameLabel.text = mvvmVM.name
                self.ratingLabel.text = String(mvvmVM.rating)
            }
        }
    }
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "gameCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
