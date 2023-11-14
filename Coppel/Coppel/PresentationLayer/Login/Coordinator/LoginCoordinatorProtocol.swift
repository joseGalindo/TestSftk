//
//  HomeCoordinatorProtocol.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/10/23.
//

import Foundation
import UIKit

protocol LoginCoordinatorProtocol: class {
    func showHome()
}

class LoginCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let parentViewController: UIViewController
    
    init(viewController: UIViewController) {
        self.navigationController = UINavigationController()
        self.parentViewController = viewController
    }
    
    func start() {
        let breedsViewController = UIViewController()
        navigationController.pushViewController(breedsViewController, animated: true)
        parentViewController.present(navigationController, animated: true, completion: nil)
        
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    func showHome() {
        let coordinator = HomeCoordinator(viewController: parentViewController)
        coordinator.start()
    }
}
