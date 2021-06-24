//
//  StartViewModel.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import Foundation
import UIKit

struct StartViewModel {
    
    let maleButtonTitle = "Superman"
    let femaleButtonTitle = "Superwoman"
    
    func createProfile(sex: String) {
        
        let profile = ProfileManager.sharedProfileManager.defaultProfile
        
        profile.sex = sex
        ProfileManager.sharedProfileManager.saveProfileData(profile: profile)
    }
}
