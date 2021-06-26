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
    
    private let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ProfileInfo").path
     
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
            let data = try PropertyListEncoder().encode(profile)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
        } catch {
            print(error)
        }
    }
    
    private func getProfileData() -> Profile? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data else {
            return nil
        }
        do {
            let profile = try PropertyListDecoder().decode(Profile?.self, from: data)
            return profile
        } catch {
            return nil
        }
    }
}
