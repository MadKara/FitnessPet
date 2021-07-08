//
//  HomeViewModel.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation

struct HomeViewModel {
    
    let options = ["Профіль", "Прогрес", "Програми", "Калькулятор", "М'язи"]
    
    enum Menu: String {
        case profile = "ProfileViewController"
        case progress = "ProgressViewController"
        case programs = "ProgramsViewController"
        case calculator = "CalculatorViewController"
        case muscles = "MusclesViewController"
    }
    
    let controllersId = [Menu.profile, .progress, .programs, .calculator, .muscles]
    
    var profile = ProfileManager.sharedProfileManager.userInfo
    var parametersList: [BodyParameter] = ProfileManager.sharedProfileManager.userInfo?.parameters ?? []
    var userName = ProfileManager.sharedProfileManager.userInfo?.name ?? ""
    
    func presentMenuControllers(indexPath: IndexPath, coordinator: MainCoordinator?, completion: SelectionClosureType<Any>? = nil) {
        
        switch controllersId[indexPath.row] {
        case .profile:
            coordinator?.presentProfile(completion: completion)
        case .progress:
            coordinator?.presentProgress()
        case .programs:
            coordinator?.presentPrograms()
        case .calculator:
            coordinator?.presentCalculator()
        case .muscles:
            coordinator?.presentMuscles()
        }
    }  
}
