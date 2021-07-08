//
//  BodyParameterViewModel.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import Foundation

class BodyParameterViewModel {
       
    let bodyPart: String
    var changedValue: Int
    var isSelected: Bool
    var lastValue: Int
    var unit: String
    
    init(model: BodyParameter) {
        bodyPart = model.bodyPart
        changedValue = model.changedValue
        isSelected = model.isSelected
        lastValue = model.valueArray.isEmpty ? 0 : model.valueArray.last!
        unit = bodyPart == "Вага" ? "кг" : "см"
    }
}
