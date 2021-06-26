//
//  BaseViewController.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let backgroundImage = "iPhone 6-7-8 – 54"

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
    }
    
    private func setBackground() {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: backgroundImage)
        background.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(background, at: 0)
    }
}
