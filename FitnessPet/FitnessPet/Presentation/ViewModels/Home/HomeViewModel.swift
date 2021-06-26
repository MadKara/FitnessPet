//
//  HomeViewModel.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

struct HomeViewModel {
    
    let options = ["Profile", "Progress", "Programs", "Calculator", "Muscles"]
    
    enum Menu: String {
        case profile = "ProfileViewController"
        case progress = "ProgressViewController"
        case programs = "ProgramsViewController"
        case calculator = "CalculatorViewController"
        case muscles = "MusclesViewController"
    }
    
    let controllersId = [Menu.profile, .progress, .programs, .calculator, .muscles]
    
}
