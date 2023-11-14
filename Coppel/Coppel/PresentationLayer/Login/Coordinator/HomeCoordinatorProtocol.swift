//
//  HomeCoordinatorProtocol.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/10/23.
//

import Foundation
import UIKit

protocol LoginCoordinatorProtocol: class {
}

class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let parentViewController: UIViewController
    
    init(viewController: UIViewController) {
        self.navigationController = UINavigationController()
        self.parentViewController = viewController
    }
    
    func start() {
        let breedsViewController = UIViewController()
        //let viewModel = BreedsViewModel(breedService: DogServices(),
         //                               coordinator: self)
        //breedsViewController.viewModel = viewModel
        navigationController.pushViewController(breedsViewController, animated: true)
        parentViewController.present(navigationController, animated: true, completion: nil)
        
    }
}

extension HomeCoordinator: LoginCoordinatorProtocol {
    
    
}
