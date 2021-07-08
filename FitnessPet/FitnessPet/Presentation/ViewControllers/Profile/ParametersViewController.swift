//
//  ParametersViewController.swift
//  FitnessPet
//
//  Created by intern on 27.06.2021.
//

import UIKit

protocol PassParameters {
    func reloadTableView()
}

class ParametersViewController: BaseViewController, Storyboarded {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var selectButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    weak var coordinator: MainCoordinator?
    
    var delegate: PassParameters?
    
    var profileViewModel: ProfileViewModel?
    var bodyParameterList: [BodyParameterViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(SampleParameterTableViewCell.nib, forCellReuseIdentifier: SampleParameterTableViewCell.identifier)
        
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableViewHeightConstraint.constant = tableView.contentSize.height
        
        titleLabel.text = profileViewModel?.titleLabelParameters
        cancelButton.setTitle(profileViewModel?.cancelButtonTitle, for: .normal)
        selectButton.setTitle(profileViewModel?.selectButtonTitle, for: .normal)
    }
    
    @IBAction func cancelParameters(_ sender: UIButton) {
        coordinator?.dismiss(animated: true)
    }
    
    @IBAction func selectParameters(_ sender: UIButton) {
        guard let profileViewModel = profileViewModel else {
            return
        }
        profileViewModel.addParameters()
        profileViewModel.onUpdateParametersList?()   // Closure
        delegate?.reloadTableView()   // Pass Parameters protocol
        //postNotification()  // Notification Center
        coordinator?.dismiss(animated: true)
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: ProfileViewController.notificationName, object: nil)
    }
}

extension ParametersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let profileViewModel = profileViewModel, let bodyParameterList = bodyParameterList else {
            return
        }
        profileViewModel.selectParameters(viewModel: bodyParameterList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let profileViewModel = profileViewModel, let bodyParameterList = bodyParameterList else {
            return
        }
        profileViewModel.deselectParameters(viewModel: bodyParameterList[indexPath.row])
    }
}

extension ParametersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodyParameterList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bodyParameterList = bodyParameterList else {
            return UITableViewCell()
        }
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: SampleParameterTableViewCell.identifier, for: indexPath) as? SampleParameterTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel: bodyParameterList[indexPath.row])
        return cell
    }
}
