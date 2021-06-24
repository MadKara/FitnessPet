//
//  ProfileManager.swift
//  FitnessPet
//
//  Created by intern on 24.06.2021.
//

import Foundation
import UIKit

class ProfileManager {
    
    static let sharedProfileManager = ProfileManager()
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ProfileInfo")
     
    var defaultProfile = Profile(
        name: "",
        sex: "",
        image: UIImage(systemName: "info.circle")!
    )
    var userInfo: Profile? {
        return getProfileData()
    }
    
    func saveProfileData(profile: Profile) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print("Error saving data")
        }
    }
    
    func getProfileData() -> Profile? {
        do {
            let data = try Data(contentsOf: filePath)
            let profile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Profile
            return profile
        } catch {
            return nil
        }
    }
}
