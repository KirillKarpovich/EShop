//
//  ESTabBarCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

final class ESTabBarCoordinator: Coordinator {
    
    private weak var rootViewController: UIViewController?
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let tabBar = ESTabBarController(coordinator: self)
        
        let homeNC = UINavigationController()
        homeNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        let homeCoordinator = HomeCoordinator(navigationController: homeNC)
        
        let favNC = UINavigationController()
        favNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Fav"), tag: 1)
        let favCoordinator = DummyCoordinator(navigationController: favNC)
        
        let cartNC = UINavigationController()
        cartNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Cart"), tag: 2)
        let cartCoordinator = DummyCoordinator(navigationController: cartNC)

        let chatNC = UINavigationController()
        chatNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Chat"), tag: 3)
        let chatCoordinator = DummyCoordinator(navigationController: chatNC)

        let profileNC = UINavigationController()
        profileNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Profile"), tag: 4)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNC)
        
        tabBar.viewControllers = [
            homeNC,
            favNC,
            cartNC,
            chatNC,
            profileNC
        ]
        
        tabBar.modalPresentationStyle = .fullScreen
        rootViewController?.present(tabBar, animated: true)

        coordinate(to: homeCoordinator)
        coordinate(to: favCoordinator)
        coordinate(to: cartCoordinator)
        coordinate(to: chatCoordinator)
        coordinate(to: profileCoordinator)
    }
}
