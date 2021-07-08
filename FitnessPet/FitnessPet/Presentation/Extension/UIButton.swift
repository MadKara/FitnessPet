//
//  UIButton.swift
//  FitnessPet
//
//  Created by intern on 02.07.2021.
//

import UIKit

extension UIButton {
    
    func setButtonDesign() {
        layer.cornerRadius = bounds.height / 2
        layer.shadowOpacity = 0.3
        setTitleColor(.white, for: .normal)
        layer.backgroundColor = UIColor.orange.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.opacity = 1
    }
}
