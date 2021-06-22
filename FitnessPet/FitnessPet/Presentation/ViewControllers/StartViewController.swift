//
//  StartViewController.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import UIKit

class StartViewController: UIViewController, Storyboarded {

    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chosenSex(_ sender: UIButton) {
        coordinator?.home()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
