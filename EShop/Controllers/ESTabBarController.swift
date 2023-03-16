//
//  ESTabBarController.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class ESTabBarController: UITabBarController {

    private weak var coordinator: ESTabBarCoordinator?
    
    init(coordinator: ESTabBarCoordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfiguration()
    }
    
    func tabBarConfiguration() {
        let tabBarAppearance = UITabBar.appearance()

        tabBarAppearance.tintColor = .systemPink
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.selectionIndicatorImage = UIImage(named: "Round")
        tabBar.layer.cornerRadius = 25
        tabBar.clipsToBounds = true
    }
}
