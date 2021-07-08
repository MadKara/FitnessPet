//
//  ParameterTableViewCell.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import UIKit

class ParameterTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var parameterName: UILabel!
    @IBOutlet private weak var parameterUnit: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var parameterState: UISwitch!
    
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
    
    public func configure(viewModel: BodyParameterViewModel) {
        parameterName.text = viewModel.bodyPart
        parameterUnit.text = viewModel.unit
        parameterState.isSelected = viewModel.isSelected
        //valueTextField.text = viewModel.changedValue
    }
}
