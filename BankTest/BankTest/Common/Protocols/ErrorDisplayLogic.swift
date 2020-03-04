//
//  ErrorDisplayLogic.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import UIKit

protocol ErrorDisplayLogic: class {
    func showError(message: String)
}

extension ErrorDisplayLogic where Self: UIViewController {

    func showError(message: String) {
        let alertController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.show(alertController, sender: nil)
    }
}
