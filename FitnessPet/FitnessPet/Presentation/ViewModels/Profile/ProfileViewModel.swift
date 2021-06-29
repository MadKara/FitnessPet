//
//  ProfileViewModel.swift
//  FitnessPet
//
//  Created by intern on 24.06.2021.
//

import Foundation
import UIKit

class ProfileViewModel {
    
    private var userProfile: Profile = ProfileManager.sharedProfileManager.userInfo!
    
    public let nameLabel = "Name"
    public let parametersLabel = "Choose the parameters"
    public let barTitle = "Profile"
    public let textFieldNamePlaceholder = "Enter your name"
    
    let bodyPartNames = [
        "Ріст",
        "Вага",
        "Шия",
        "Груди",
        "Плечі",
        "Біцепс лівий",
        "Біцепс правий",
        "Передпліччя ліве",
        "Передпліччя праве",
        "Талія",
        "Таз",
        "Бедро ліве",
        "Бедро праве",
        "Гомілка ліва",
        "Гомілка права",
        "Кісточка ліва",
        "Кісточка права"
    ]
}