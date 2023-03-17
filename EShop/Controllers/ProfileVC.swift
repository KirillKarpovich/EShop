//
//  ProfileVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class ProfileVC: UIViewController {

    private let coordinator: ProfileCoordinator
    private let button = UIButton()
    
    
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
        view.backgroundColor = .systemMint
        view.addSubview(button)
        button.setTitle("Log Out", for: .normal)
        button.centerXInSuperview()
        button.centerYInSuperview()
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc func dismissVC() {
        coordinator.coordinateToLogout()
    }
    
}
