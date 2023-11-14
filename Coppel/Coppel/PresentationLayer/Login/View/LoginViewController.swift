//
//  ViewController.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/10/23.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    // UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    
    // Properties
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(self)
        bindModel()
        setupUI()
        
    }

    
    @IBAction func doLogin(_ sender: Any) {
        viewModel.sendCredentials()
    }
    
}

// MARK: - UITextFieldsDelegates
extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            viewModel.userInput.send(textField.text ?? "")
        }
        if textField == passwordTextField {
            viewModel.passwdInput.send(textField.text ?? "")
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(true)
        return false
    }
}

extension LoginViewController {
    
    func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }
    
    func bindModel() {
        viewModel.isValidOptions.sink { [weak self] validFields in
            let color: UIColor = validFields ? .systemBlue : .gray
            self?.logInBtn.backgroundColor = color
            self?.logInBtn.isEnabled = validFields
        }.store(in: &cancellables)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
