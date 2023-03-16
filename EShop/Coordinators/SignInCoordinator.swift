//
//  SignInCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

protocol SignInFlow: AnyObject {
    func coordinateToTabBar()
    func coordinateToLogIn()
}

final class SignInCoordinator: Coordinator, SignInFlow {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignInVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func coordinateToTabBar() {
        let tabBarCoordinator = ESTabBarCoordinator(rootViewController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
    func coordinateToLogIn() {

    }
}
