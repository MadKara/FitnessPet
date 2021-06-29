//
//  ProfileViewController.swift
//  FitnessPet
//
//  Created by intern on 23.06.2021.
//

import UIKit

class ProfileViewController: BaseViewController, Storyboarded {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var chooseParametersLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private var profileViewModel = ProfileViewModel()
    private let parametersViewController = ParametersViewController()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllerDesign()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ParameterTableViewCell.nib, forCellReuseIdentifier: ParameterTableViewCell.identifier)
    }
    
    @IBAction func addParametersPressed(_ sender: UIButton) {
        coordinator?.presentParameters()
    }
    
    
    private func setControllerDesign() {
        nameLabel.text = profileViewModel.nameLabel
        chooseParametersLabel.text = profileViewModel.parametersLabel
        nameTextField.placeholder = profileViewModel.textFieldNamePlaceholder
        self.title = profileViewModel.barTitle
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.bodyPartNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParameterTableViewCell.identifier, for: indexPath) as! ParameterTableViewCell
        cell.configure(bodyPart: profileViewModel.bodyPartNames[indexPath.row])
        return cell
    }
}
