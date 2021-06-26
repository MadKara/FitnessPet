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
    @IBOutlet private weak var labelSex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MenuTableViewCell.nib, forCellReuseIdentifier: MenuTableViewCell.identifier)
        
        labelSex.text = ProfileManager.sharedProfileManager.userInfo?.sex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
        
        switch homeViewModel.controllersId[indexPath.row] {
        case .profile:
            coordinator?.presentProfile()
        case .progress:
            coordinator?.presentProgress()
        case .programs:
            coordinator?.presentPrograms()
        case .calculator:
            coordinator?.presentCalculator()
        case .muscles:
            coordinator?.presentMuscles()
        }
    }
}
