//
//  HomeViewController.swift
//  FitnessPet
//
//  Created by intern on 22.06.2021.
//

import UIKit

class HomeViewController: BaseViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    private var homeViewModel = HomeViewModel()

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var sexLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainViewControllerConfig()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MenuTableViewCell.nib, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupUserInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setMainViewControllerConfig() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .yellow
        navigationItem.setHidesBackButton(true, animated: true)
      }

    func setupUserInfo() {
        sexLabel.text = homeViewModel.profile?.sex
        nameLabel.text = homeViewModel.userName
    }
}
//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
        cell.configure(title: homeViewModel.options[indexPath.row])
        return cell
    }
}
//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        homeViewModel.presentMenuControllers(indexPath: indexPath, coordinator: coordinator) { [weak self] profileViewModel in
            guard let profileViewModel = profileViewModel as? ProfileViewModel else {
                return
            }
            self?.homeViewModel.userName = profileViewModel.userName ?? ""
            self?.homeViewModel.parametersList = profileViewModel.profileParametersList!
            self?.setupUserInfo()
        }
    }
}
