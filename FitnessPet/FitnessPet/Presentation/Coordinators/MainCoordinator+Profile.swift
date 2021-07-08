//
//  MainCoordinator+Profile.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

extension MainCoordinator {
    
    func presentProfile(completion: SelectionClosureType<ProfileViewModel>?) {
        let vc = ProfileViewController.instantiate()
        vc.coordinator = self
        vc.onUpdateProfile = completion
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentParameters(viewController: ParametersViewController, viewModel: ProfileViewModel) {
        viewController.coordinator = self
        viewController.profileViewModel = viewModel
        navigationController.present(viewController, animated: true)
    }
}
