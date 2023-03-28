//
//  LoginCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 28.03.23.
//

import UIKit

protocol LoginFlow: AnyObject {
    func coordinateToTabBar()
}

class LoginCoordinator: Coordinator, LoginFlow {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
   
    func start() {
        let vc = LogInVC(coordinator: self )
        navigationController.pushViewController(vc, animated: true)
    }
   
    func coordinateToTabBar() {
        let tabBarCoordinator = ESTabBarCoordinator(rootViewController: navigationController)
//        coordinate(to: tabBarCoordinator)
        tabBarCoordinator.start()
    }
}
