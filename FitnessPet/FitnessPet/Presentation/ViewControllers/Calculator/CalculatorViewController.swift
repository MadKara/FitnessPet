//
//  CalculatorViewController.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import UIKit

class CalculatorViewController: BaseViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"
        // Do any additional setup after loading the view.
    }
}
