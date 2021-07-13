//
//  ParametersCollectionViewCell.swift
//  FitnessPet
//
//  Created by intern on 08.07.2021.
//

import UIKit

class ParametersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parameterName: UILabel!
    @IBOutlet weak var changedValue: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    static let identifier = "ParametersCollectionViewCell"
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: BodyParameterViewModel) {
        parameterName.text = viewModel.bodyPart
    }
}
