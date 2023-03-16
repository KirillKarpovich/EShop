//
//  AppCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let startCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
