//
//  ViewControllerExtensions.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

extension UIViewController {
    func showDefaultAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
