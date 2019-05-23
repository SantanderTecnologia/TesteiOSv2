//
//  LoginViewController.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField! {
        didSet {
            loginTextField.font = UIFont.preferredFont(forTextStyle: .body)
            loginTextField.placeholder = "CPF ou email"
            loginTextField.delegate = self
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.font = UIFont.preferredFont(forTextStyle: .body)
            passwordTextField.placeholder = "Senha"
            passwordTextField.delegate = self
            passwordTextField.isSecureTextEntry = true
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            self.loginButton.backgroundColor = UIColor.purple
            self.loginButton.setTitle("Login", for: .normal)
            self.loginButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.rounded(radius: 4.0)
            setButtonEnabled(isEnabled: false)
        }
    }
    
    @IBAction func didEditFields() {
        presenter?.didEditFields(user: loginTextField.text, password: passwordTextField.text)
    }
    
    
    @IBAction func login() {
        presenter?.login(user: loginTextField.text, password: passwordTextField.text)
    }
    
    var presenter: LoginPresenterDelegate? {
        didSet {
            self.presenter?.set(view: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension LoginViewController: LoginViewDelegate {
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Atenção!", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setLoadingHidden(isHidden: Bool) {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = isHidden
            UIApplication.shared.isNetworkActivityIndicatorVisible = !isHidden
        }
    }
    
    func setButtonEnabled(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
        loginButton.alpha = isEnabled ? 1 : 0.66
    }
    
    func setFields(user: String, password: String) {
        loginTextField.text = user
        passwordTextField.text = user
        setButtonEnabled(isEnabled: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
