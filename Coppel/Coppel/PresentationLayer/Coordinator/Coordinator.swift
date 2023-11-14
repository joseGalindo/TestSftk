//
//  Coordinator.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/10/23.
//

import Foundation

protocol Coordinator: class {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
