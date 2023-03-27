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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.changeHeight()
    }
 
    
    func tabBarConfiguration() {
        let tabBarAppearance = UITabBar.appearance()
        
        tabBarAppearance.tintColor = .darkGray
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.selectionIndicatorImage = UIImage(named: "Round")
        tabBar.layer.cornerRadius = 25
        tabBar.clipsToBounds = true
    }
    
    func changeHeight() {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height-100
            tabBar.frame = tabFrame
        }
    }
}
