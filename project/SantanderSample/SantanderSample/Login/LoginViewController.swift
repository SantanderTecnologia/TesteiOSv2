//
//  LoginViewController.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright (c) 2018 Virgilius Santos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class {
  func display(viewModel: Login.ViewModel)
}

class LoginViewController: UIViewController {
    
    var interactor: (LoginBusinessLogic & LoginDataStore)!
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)!


    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        KeyboardManager.shared.enable = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        KeyboardManager.shared.enable = false
    }
    
    // MARK: Do something

    @IBOutlet weak var logoView: LogoView!
    
    @IBOutlet weak var idView: InputTextView! {
        didSet {
            idView.setPlaceholder("User")
            idView.textField.text = "33333749866"
        }
    }
    
    @IBOutlet weak var passwordView: InputTextView! {
        didSet {
            passwordView.setPlaceholder("Password")
//            passwordView.textField.isSecureTextEntry = true
            passwordView.textField.text = "@Was1"
        }
    }
    
    @IBOutlet weak var loginButtonView: LoginButtonView! {
        didSet {
            let button = loginButtonView.loginButton
            button?.addTarget(self,
                              action: #selector(loginAction),
                              for: .touchUpInside)
        }
    }
    
    @objc func loginAction() {
        var request = Login.Request()
        request.user = idView.textField.text
        request.password = passwordView.textField.text
        interactor.auth(request: request)
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension LoginViewController: LoginDisplayLogic {
    
    // MARK: Routing
    
    func display(viewModel: Login.ViewModel) {
        if viewModel.error != nil {
            showAlert(withMessage: viewModel.error!)
        } else {
            router.routeToDetails()
        }
    }
    
    private func showAlert(withMessage message: String){
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
