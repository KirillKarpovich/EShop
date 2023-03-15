//
//  ESTabBarController.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class ESTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfiguration()
        viewControllers = [
        createHomeNavigationController(),
        createFavNavigationController(),
        createCartNavigationController(),
        createChatNavigationController(),
        createProfileNavigationController()
        ]
    }
    
    func tabBarConfiguration() {
        let tabBarAppearance = UITabBar.appearance()

        tabBarAppearance.tintColor = .systemPink
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.selectionIndicatorImage = UIImage(named: "Round")
        tabBar.layer.cornerRadius = 25
        tabBar.clipsToBounds = true
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Trade by Kirill"
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createFavNavigationController() -> UINavigationController {
        let favVC = FavoritesVC()
        favVC.title = "Favorites"
        favVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Fav"), tag: 1)
        
        return UINavigationController(rootViewController: favVC)
    }
    
    func createCartNavigationController() -> UINavigationController {
        let cartVC = CartVC()
        cartVC.title = "Your Cart"
        cartVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Cart"), tag: 2)
        
        return UINavigationController(rootViewController: cartVC)
    }
    
    func createChatNavigationController() -> UINavigationController {
        let chatVC = ChatVC()
        chatVC.title = "Chat"
        chatVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Chat"), tag: 3)
        
        return UINavigationController(rootViewController: chatVC)
    }
    
    func createProfileNavigationController() -> UINavigationController {
        let profileVC = ProfileVC()
        profileVC.title = "Profile"
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Profile"), tag: 4)
        
        return UINavigationController(rootViewController: profileVC)
    }
}
