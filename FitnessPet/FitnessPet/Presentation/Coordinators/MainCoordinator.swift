//
//  MainCoordinator.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if ProfileManager.sharedProfileManager.userInfo != nil {
            let homeVC = HomeViewController.instantiate()
            homeVC.coordinator = self
            navigationController.pushViewController(homeVC, animated: false)
        } else {
            let startVC = StartViewController.instantiate()
            startVC.coordinator = self
            navigationController.pushViewController(startVC, animated: false)
        }
    }
    
    func home() {
        let vc = HomeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
