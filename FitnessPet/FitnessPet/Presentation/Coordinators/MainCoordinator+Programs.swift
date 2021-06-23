//
//  MainCoordinator+Programs.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

extension MainCoordinator {
    
    func presentPrograms() {
        let vc = ProgramsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
