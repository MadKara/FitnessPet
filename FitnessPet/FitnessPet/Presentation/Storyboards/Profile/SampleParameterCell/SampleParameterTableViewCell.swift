//
//  SampleParameterTableViewCell.swift
//  FitnessPet
//
//  Created by intern on 01.07.2021.
//

import UIKit

class SampleParameterTableViewCell: UITableViewCell {

    @IBOutlet weak var sampleParameter: UILabel!
    
    static let identifier = "SampleParameterTableViewCell"
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
        // Configure the view for the selected state
    }
    
    func configure(viewModel: BodyParameterViewModel) {
        sampleParameter.text = viewModel.bodyPart
    }
}
