//
//  Profile.swift
//  FitnessPet
//
//  Created by intern on 24.06.2021.
//

import Foundation
import UIKit

class Profile: NSObject, NSCoding {
    
    var name: String
    var sex: String
    var image: UIImage
    
    init(name: String, sex: String, image: UIImage) {
        self.name = name
        self.sex = sex
        self.image = image
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(sex, forKey: "sex")
        coder.encode(image, forKey: "image")
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: "name") as? String,
              let sex = coder.decodeObject(forKey: "sex") as? String,
              let image = coder.decodeObject(forKey: "image") as? UIImage else {
            return nil
        }
        self.init(name: name, sex: sex, image: image)
    }
}
