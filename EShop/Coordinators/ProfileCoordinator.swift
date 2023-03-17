//
//  ProfileCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

protocol ProfileFlow: AnyObject {
    func coordinateToLogout()
}

class ProfileCoordinator: Coordinator, ProfileFlow {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileVC(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func coordinateToLogout() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }
}
