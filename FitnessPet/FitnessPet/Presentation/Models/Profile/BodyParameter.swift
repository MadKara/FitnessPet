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
    
    enum CodingKeys: String, CodingKey {
        case bodyPart
        case changeValue
        case dateArray
        case isSelected
        case valuArray
        case lastValue
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bodyPart, forKey: .bodyPart)
        try container.encode(changedValue, forKey: .changeValue)
        try container.encode(dateArray, forKey: .dateArray)
        try container.encode(isSelected, forKey: .isSelected)
        try container.encode(valueArray, forKey: .valuArray)
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        bodyPart = try container.decode(String.self, forKey: .bodyPart)
        changedValue = try container.decode(Int.self, forKey: .changeValue)
        dateArray = try container.decode([Date].self, forKey: .dateArray)
        isSelected = try container.decode(Bool.self, forKey: .isSelected)
        valueArray = try container.decode([Int].self, forKey: .valuArray)
    }
}
