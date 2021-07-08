//
//  Profile.swift
//  FitnessPet
//
//  Created by intern on 24.06.2021.
//

import Foundation
import UIKit

class Profile: Codable {
    
    var name: String
    var sex: String
    var image: UIImage
    var parameters: [BodyParameter]?
    
    init(name: String, sex: String, image: UIImage, parameters: [BodyParameter]?) {
        self.name = name
        self.sex = sex
        self.image = image
        self.parameters = parameters
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case sex
        case image
        case parameters
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(sex, forKey: .sex)
        
        let data: Data = image.pngData()!
        let stringBase64 = data.base64EncodedString(options: .lineLength64Characters)
        try container.encode(stringBase64, forKey: .image)
        
        try container.encode(parameters, forKey: .parameters)
    }
    required init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        sex = try container.decode(String.self, forKey: .sex)
        
        let stringBase64 = try container.decode(String.self, forKey: .image)
        let data = Data(base64Encoded: stringBase64, options: .ignoreUnknownCharacters)!
        image = UIImage(data: data)!
        
        parameters = try container.decode([BodyParameter].self, forKey: .parameters)
    }
}
