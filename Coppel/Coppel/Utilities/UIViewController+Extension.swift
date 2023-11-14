//
//  UIViewController+Extension.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/14/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
