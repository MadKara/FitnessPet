//
//  Storyboarded.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: id, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
