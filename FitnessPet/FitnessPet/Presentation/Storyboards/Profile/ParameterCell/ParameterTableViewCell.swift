//
//  ParameterTableViewCell.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import UIKit

class ParameterTableViewCell: UITableViewCell {

    @IBOutlet private weak var parameterName: UILabel!
    
    static let identifier = "ParameterTableViewCell"
    
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
    
    public func configure(bodyPart: String) {
        parameterName.text = bodyPart
    }
    
}
