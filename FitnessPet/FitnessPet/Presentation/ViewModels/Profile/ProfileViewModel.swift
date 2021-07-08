//
//  ProfileViewModel.swift
//  FitnessPet
//
//  Created by intern on 24.06.2021.
//

import Foundation

typealias EmptyClosure = () -> Void
typealias SelectionClosureType<T> = (T) -> Void

class ProfileViewModel {
    
    private var userProfile: Profile = ProfileManager.sharedProfileManager.userInfo!
    
    let nameLabel = "Ім'я"
    let parametersLabel = "Оберіть параметри"
    let barTitle = "Профіль"
    let textFieldNamePlaceholder = "Введіть ім'я"
    let buttonTitle = "Добавити параметри"
    let cancelButtonTitle = "Скасувати"
    let selectButtonTitle = "Обрати"
    let titleLabelParameters = "Параметри"
    
    var userName: String?
    var nameText: String? {
        didSet {
            ProfileManager.sharedProfileManager.userInfo?.name = nameText ?? ""
        }
    }
    
    var profileParameters = BodyParameterStorage()
    var profileParametersList: [BodyParameter]? //existed
    var profileParametersViewModel: [BodyParameterViewModel]?
    var selectedParameters = [BodyParameter]() //temporary
    var selectedParametersViewModel = [BodyParameterViewModel]()
    
    var onUpdateParametersList: EmptyClosure?
    
    init() {
        profileParameters.showAllParameters()
        fetchBodyParameterViewModels()
    }
    
    func fetchBodyParameterViewModels() {
        userName = userProfile.name
        profileParametersList = userProfile.parameters
        profileParametersViewModel = profileParametersList?.map({ (parameter) -> BodyParameterViewModel in
            createBodyParameterViewModel(bodyParameter: parameter)
        })
    }
    
    private func createBodyParameterViewModel(bodyParameter: BodyParameter) -> BodyParameterViewModel {
        let bodyParameterViewModel = BodyParameterViewModel(model: bodyParameter)
        return bodyParameterViewModel
    }
    
    func filteredBodyParametersList() -> [BodyParameterViewModel] {
        var profileBodyParameterViewModels = [BodyParameterViewModel]()
        for parameter in profileParameters.parametersList {
            if !profileParametersList!.contains(where: {$0.bodyPart == parameter.bodyPart}) {
                let viewModel = BodyParameterViewModel(model: parameter)
                profileBodyParameterViewModels.append(viewModel)
            }
        }
        return profileBodyParameterViewModels
    }
    
    //MARK: - Update profile info
    func updateProfile() {
        userProfile.name = userName ?? ""
        userProfile.parameters = profileParametersList ?? []
        ProfileManager.sharedProfileManager.saveProfileData(profile: userProfile)
    }
    
    func updateProfileName(name: String) {
        userName = name
        userProfile.name = name
    }
    
    //MARK: - Manipulation with parameters
    func selectParameters(viewModel: BodyParameterViewModel) {
        if !selectedParametersViewModel.contains(where: {$0.bodyPart == viewModel.bodyPart}) {
            selectedParametersViewModel.append(viewModel)
        }
    }
    
    func deselectParameters(viewModel: BodyParameterViewModel) {
        if let deselectedParameter = selectedParametersViewModel.firstIndex(where: {$0.bodyPart == viewModel.bodyPart}) {
            selectedParametersViewModel.remove(at: deselectedParameter)
        }
    }
    
    func addParameters() {
        for viewModel in selectedParametersViewModel {
            if !profileParametersViewModel!.contains(where: {$0.bodyPart == viewModel.bodyPart}) {
                profileParametersViewModel?.append(viewModel)
                if let parameter = profileParameters.parametersList.first(where: {$0.bodyPart == viewModel.bodyPart}) {
                    profileParametersList?.append(parameter)
                }
            }
        }
    }
    
    func removeParameters(index: Int) {
        profileParametersList?.remove(at: index)
        profileParametersViewModel?.remove(at: index)
    }
}
