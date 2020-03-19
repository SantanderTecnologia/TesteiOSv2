//
//  LoginView.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginView(_ loginView: LoginView, validateLogin user: String, andPassword password: String) -> Bool
    func loginView(_ loginView: LoginView, tryLoginWithUser user: String, andPassword password: String)
}

class LoginView: XibView {
    
    // MARK: - Outlets

    @IBOutlet weak private(set) var userTextField: UITextField!
    @IBOutlet weak private(set) var passwordTextField: UITextField!
    @IBOutlet weak private(set) var loginButton: UIButton!
    @IBOutlet weak private(set) var errorMessageLabel: UILabel!
    
    // MARK: - Properties
    
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Initialization

    override open func setupView() {
        loginButton.addDropShadow(color: UIColor(hex: "#3B48EE", default: .blue),
                                  offset: CGSize(width: 4.0, height: 4.0),
                                  radius: 4.0,
                                  opacity: 0.3)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        
        // TODO: Setup Formatter for CPF / email
    }

    // MARK: - Actions
    
    @objc func handleTap() {
        self.endEditing(true)
    }

    @IBAction func doLogin() {
        let login = self.userTextField?.text ?? ""
        let password = self.passwordTextField.text ?? ""

        guard let delegate = self.delegate else { return }
        
        if !delegate.loginView(self, validateLogin: login, andPassword: password) {
            errorMessageLabel.text = "Usuário / senha inválido"
            return
        } else {
            errorMessageLabel.text = ""
        }
        
        delegate.loginView(self,
                           tryLoginWithUser: login,
                           andPassword: password)
    }

}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            doLogin()
        }
        return true
    }
    
}
