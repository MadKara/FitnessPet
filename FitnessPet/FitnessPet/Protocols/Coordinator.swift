//
//  Coordinator.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
