//
//  StartViewController.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import UIKit

class StartViewController: BaseViewController, Storyboarded {

    var coordinator: MainCoordinator?
    var startVievModel = StartViewModel()
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleButton.setTitle(startVievModel.maleButtonTitle, for: .normal)
        femaleButton.setTitle(startVievModel.femaleButtonTitle, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    @IBAction func chosenSex(_ sender: UIButton) {
        
        if let title = sender.title(for: .normal) {
            startVievModel.createProfile(sex: title)
            coordinator?.home()
        }
    }
}
