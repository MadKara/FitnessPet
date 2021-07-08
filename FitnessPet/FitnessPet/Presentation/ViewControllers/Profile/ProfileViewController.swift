//
//  ProfileViewController.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import UIKit

class ProfileViewController: BaseViewController, Storyboarded, PassParameters {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var chooseParametersLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var buttonParameters: UIButton!
    
    var profileViewModel = ProfileViewModel()
    var onUpdateProfile: SelectionClosureType<ProfileViewModel>?
    
    weak var coordinator: MainCoordinator?
    
    static let notificationName = Notification.Name("reloadTable")  // Notification Center
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllerDesign()
        reloadProfileParameters()
        
        nameTextField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ParameterTableViewCell.nib, forCellReuseIdentifier: ParameterTableViewCell.identifier)
        //addObservers()  //Notification center
    }
    
    @IBAction func saveProfile(_ sender: UIBarButtonItem) {
        profileViewModel.updateProfile()
        onUpdateProfile?(profileViewModel)
        coordinator?.back()
    }
    
    private func setControllerDesign() {
        nameLabel.text = profileViewModel.nameLabel
        chooseParametersLabel.text = profileViewModel.parametersLabel
        nameTextField.text = profileViewModel.userName
        self.title = profileViewModel.barTitle
        buttonParameters.setTitle(profileViewModel.buttonTitle, for: .normal)
        buttonParameters.setButtonDesign()
    }
    
    //MARK: - PassParameters protocol
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    //MARK: - Notification Center
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: ProfileViewController.notificationName, object: nil)
    }
    
    @objc
    func updateTableView() {
        tableView.reloadData()
    }
    
    //MARK: - Get parameters
    @IBAction func addParametersPressed(_ sender: UIButton) {
        let parametersViewConntroller = ParametersViewController.instantiate()
        
        parametersViewConntroller.profileViewModel = profileViewModel
        parametersViewConntroller.bodyParameterList = profileViewModel.filteredBodyParametersList()
        //parametersViewConntroller.delegate = self   //Pass parameters delegate
        let transitionDelegate = ParametersTransitioningDelegate(inset: 16)
        
        self.transitioningDelegate = transitionDelegate
        self.modalPresentationStyle = .custom
        parametersViewConntroller.transitioningDelegate = transitionDelegate
        parametersViewConntroller.modalPresentationStyle = .custom
        
        coordinator?.presentParameters(viewController: parametersViewConntroller, viewModel: profileViewModel)
    }
    
    //MARK: - Closure
    func reloadProfileParameters() {
        profileViewModel.onUpdateParametersList = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
//MARK: - extension Notification Center
extension Notification {
    enum Key: String {
        case parameters
    }
}
//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var rowAction = [UITableViewRowAction]()
        let deleteRow = UITableViewRowAction(style: .normal, title: "Delete") { (UITableViewRowAction, indexPath) in
            self.profileViewModel.removeParameters(index: indexPath.row)
            self.tableView.reloadData()
        }
        deleteRow.backgroundColor = UIColor.red
        rowAction.append(deleteRow)
        return !rowAction.isEmpty ? rowAction : nil
    }
}
//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.profileParametersViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = profileViewModel.profileParametersViewModel else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ParameterTableViewCell.identifier, for: indexPath) as? ParameterTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel: viewModel[indexPath.row])
        return cell
    }
}

//MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        profileViewModel.nameText = textField.text ?? ""
        profileViewModel.updateProfileName(name: textField.text ?? "")
    }
}
