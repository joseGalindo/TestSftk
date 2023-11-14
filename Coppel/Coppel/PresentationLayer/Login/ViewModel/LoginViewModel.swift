//
//  LoginViewModel.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/10/23.
//

import Foundation
import Combine
import UIKit

protocol LoginViewModelProtocol: class {
    
    // inputs
    var userInput: PassthroughSubject<String, Never> { get }
    var passwdInput: PassthroughSubject<String, Never> { get }
    
    // Output
    var isValidOptions: CurrentValueSubject<Bool, Never> { get }
    
    // Properties
    var coordinator: LoginCoordinatorProtocol { get }
    
    func sendCredentials()
}


class LoginViewModel: LoginViewModelProtocol {
    // Inputs
    var userInput = PassthroughSubject<String, Never>()
    var passwdInput = PassthroughSubject<String, Never>()
    // Output
    var isValidOptions = CurrentValueSubject<Bool, Never>(false)
    // Properties
    var coordinator: LoginCoordinatorProtocol
    // private properties
    private var cancelables = Set<AnyCancellable>()
    
    init(_ rootController: UIViewController) {
        coordinator = LoginCoordinator(viewController: rootController)
        bindTextInputs()
    }
    
    private func bindTextInputs() {
        Publishers.CombineLatest(userInput, passwdInput)
            .map { (email, password) -> Bool in
                return (!email.isEmpty) &&
                    (!password.isEmpty) &&
                    password.count > 8
            }.sink { [weak self] (validFields) in
                self?.isValidOptions.send(validFields)
            }.store(in: &cancelables)
    }
    
    func sendCredentials() {
        if true { //
            coordinator.showHome()
        }
    }
}


