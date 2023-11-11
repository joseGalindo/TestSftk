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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func doLogin(_ sender: Any) {
    }
    
}

// MARK: - Actions
extension LoginViewController {
    
}

