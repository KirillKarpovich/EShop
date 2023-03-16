//
//  HomeCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

protocol HomeFlow: AnyObject {
    func navigateToDetails()
}

class HomeCoordinator: Coordinator, HomeFlow {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeVC(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToDetails() {

    }
}
