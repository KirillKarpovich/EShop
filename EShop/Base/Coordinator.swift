//
//  Coordinator.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
