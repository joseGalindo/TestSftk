//
//  HomeCoordinator.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/12/23.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol: class {
    func presentAnotherController()
}

class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let parentViewController: UIViewController
    
    init(viewController: UIViewController) {
        self.navigationController = UINavigationController()
        self.parentViewController = viewController
    }
    
    func start() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeController = storyBoard.instantiateViewController(identifier: "HomeViewController") as HomeViewController
        navigationController.modalPresentationStyle = .fullScreen
        let viewModel = HomeViewModel()
        //let viewModel = BreedsViewModel(breedService: DogServices(),
        homeController.viewModel = viewModel
        navigationController.pushViewController(homeController, animated: true)
        parentViewController.present(navigationController, animated: true, completion: nil)
        
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func presentAnotherController() {
    }
}
