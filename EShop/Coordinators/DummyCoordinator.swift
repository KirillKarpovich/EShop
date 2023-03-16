//
//  DummyCoordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class DummyCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DummyVC()
        navigationController.pushViewController(vc, animated: true)
    }
}
