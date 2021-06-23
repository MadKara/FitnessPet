//
//  MainCoordinator+Calculator.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

extension MainCoordinator {
    
    func presentCalculator() {
        let vc = CalculatorViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
