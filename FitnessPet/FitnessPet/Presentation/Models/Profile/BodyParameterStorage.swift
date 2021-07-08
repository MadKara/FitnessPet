//
//  BodyParameterStorage.swift
//  FitnessPet
//
//  Created by intern on 28.06.2021.
//

import Foundation

class BodyParameterStorage {
    
  var parametersList = [BodyParameter]()
    
    func showAllParameters() {
        
        let bodyPartNames = [
            "Ріст",
            "Вага",
            "Шия",
            "Груди",
            "Плечі",
            "Біцепс лівий",
            "Біцепс правий",
            "Передпліччя ліве",
            "Передпліччя праве",
            "Талія",
            "Таз",
            "Бедро ліве",
            "Бедро праве",
            "Гомілка ліва",
            "Гомілка права",
            "Кісточка ліва",
            "Кісточка права"
        ]
        
        parametersList = bodyPartNames.map({ (bodyPartName) -> BodyParameter in
            BodyParameter(bodyPart: bodyPartName, changedValue: 0, dateArray: [], isSelected: false, valueArray: [])
        })
    }
    
    func fetchProfileParametersViewModels() -> [BodyParameterViewModel] {
        showAllParameters()
        return parametersList.map { (parameter) -> BodyParameterViewModel in
            BodyParameterViewModel(model: parameter)
        }
    }
}
