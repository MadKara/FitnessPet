//
//  MainCoordinator+Muscles.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

extension MainCoordinator {
    
    func presentMuscles() {
        let vc = MusclesViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
