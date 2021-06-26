//
//  ProfileViewController.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import UIKit

class ProfileViewController: BaseViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        // Do any additional setup after loading the view.
    }
}
