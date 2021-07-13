//
//  BodyParameterViewModel.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import Foundation
import UIKit

class BodyParameterViewModel {
       
    let bodyPart: String
    var changedValue: Int
    var isSelected: Bool
    var lastValue: Int
    var unit: String
    var colorOfValue: UIColor
    var changedValueText: String
    var valueText: String {
        lastValue == 0 ? "" : "\(lastValue)"
    }
    
    init(model: BodyParameter) {
        bodyPart = model.bodyPart
        changedValue = model.changedValue
        isSelected = model.isSelected
        lastValue = model.valueArray.isEmpty ? 0 : model.valueArray.last!
        unit = bodyPart == "Вага" ? "кг" : "см"
        
        if changedValue < 0 {
            colorOfValue = .red
            changedValueText = String(changedValue)
        } else if changedValue > 0 {
            colorOfValue = .green
            changedValueText = String(changedValue)
        } else {
            colorOfValue = .clear
            changedValueText = ""
        }
    }
}
