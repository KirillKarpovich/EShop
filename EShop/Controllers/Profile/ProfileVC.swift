//
//  ProfileVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class ProfileVC: UITableViewController {

    private let coordinator: ProfileCoordinator
    
    let profileCategories: [ProfileCategory] = [
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Trade store"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Payment method"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Balance"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Trade history"),
        ProfileCategory(image: UIImage(named: "RestorePurchase"), name: "Restore Purchase"),
        ProfileCategory(image: UIImage(named: "Help"), name: "Help"),
        ProfileCategory(image: UIImage(named: "Logout"), name: "Log out"),
    ]

    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        tableView.isScrollEnabled = false
        view.backgroundColor = .systemMint
        tableView.register(ProfileTableCell.self, forCellReuseIdentifier: ProfileTableCell.identifier)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.identifier) as? ProfileTableCell else {
            return UITableViewCell()
        }
       
        let category = profileCategories[indexPath.row]
        cell.cellLabel.text = category.name
        cell.cellImageView.image = category.image
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
    
//    @objc func dismissVC() {
//        coordinator.coordinateToLogout()
//    }
    
}
