//
//  BodyParameterModel.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import Foundation

class BodyParameter: Codable {
    
    let bodyPart: String
    var changedValue: Int
    var dateArray: [Date]
    var isSelected: Bool
    var valueArray: [Int]
    var lastValue: Int {
        return valueArray.isEmpty ? 0 : valueArray.last!
    }
    
    init(bodyPart: String, changedValue: Int, dateArray: [Date], isSelected: Bool, valueArray: [Int]) {
        self.bodyPart = bodyPart
        self.changedValue = changedValue
        self.dateArray = dateArray
        self.isSelected = isSelected
        self.valueArray = valueArray
    }
    
}
