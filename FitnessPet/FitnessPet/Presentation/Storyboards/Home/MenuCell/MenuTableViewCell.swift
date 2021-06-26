//
//  MenuTableViewCell.swift
//  FitnessPet
//
//  Created by intern on 26.06.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet private weak var menuLabel: UILabel!
    
    static let identifier = "MenuTableViewCell"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(title: String) {
        menuLabel.text = title
    }
    
}
