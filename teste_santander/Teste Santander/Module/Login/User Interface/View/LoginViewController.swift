//
//  LoginViewController.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import RNLoadingButton_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var boxViewUser: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var boxViewPassword: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginbutton: RNLoadingButton!
    @IBOutlet weak var errorUserLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    
    var presenter: LoginPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupField()
        setupButton()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        presenter?.didTap()
    }
    
    func setupField(){
        errorUserLabel.text = ""
        errorPasswordLabel.text = ""
        boxViewUser.layer.borderWidth = 1
        boxViewUser.layer.borderColor = primaryColor.cgColor
        userTextField.backgroundColor = .white
        boxViewUser.backgroundColor = .white
        boxViewUser.layer.cornerRadius = 4
        
        boxViewPassword.layer.borderWidth = 1
        boxViewPassword.layer.borderColor = primaryColor.cgColor
        passwordTextField.backgroundColor = .white
        boxViewPassword.backgroundColor = .white
        boxViewPassword.layer.cornerRadius = 4
        userTextField.attributedPlaceholder =  NSAttributedString(string:userTextField.placeholder != nil ? userTextField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: textColor])
        
         passwordTextField.attributedPlaceholder =  NSAttributedString(string:passwordTextField.placeholder != nil ? passwordTextField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: textColor])
    }
    
    func setupButton() {
        loginbutton.layer.cornerRadius = 4
        loginbutton.layer.applySketchShadow(color: colorShadow, alpha: 1, x: 0, y: 3, blur: 6, spread: 0)
        loginbutton.layer.masksToBounds = false
    }
    
    @IBAction func sendButton(_ sender: Any) {
        presenter?.send(user: userTextField.text, password: passwordTextField.text)
    }
}

extension LoginViewController: LoginPresenterOutput {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Opss Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { (_) in
         
        }))
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in
            self.presenter?.send(user: self.userTextField.text, password: self.passwordTextField.text)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func loading() {
        loginbutton.isEnabled = false
        loginbutton.isLoading = true
        loginbutton.hideTextWhenLoading = false
        loginbutton.activityIndicatorEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        loginbutton.setTitleColor(.white, for: UIControl.State.disabled)
        loginbutton.setTitle("Loading...", for: .disabled)
        loginbutton.activityIndicatorColor = .white
        loginbutton.activityIndicatorAlignment = RNActivityIndicatorAlignment.left
    }
    
    func stopLoading() {
        loginbutton.isEnabled = true
        loginbutton.isLoading = false
        loginbutton.setTitle("Login", for: .normal)
    }

    func didCloseKeyboard() {
        view.endEditing(true)
    }
    
    func cleanFields() {
        setupField()
    }
    
    func showErrorUser(title: String) {
        errorUserLabel.text = title
        errorUserLabel.textColor = errorColor
        boxViewUser.layer.borderColor = errorColor.cgColor
        userTextField.attributedPlaceholder =  NSAttributedString(string:userTextField.placeholder != nil ? userTextField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: errorColor])
        
    }
    
    func showErrorPassword(title: String) {
        errorPasswordLabel.text = title
        errorPasswordLabel.textColor = errorColor
        boxViewPassword.layer.borderColor = errorColor.cgColor
        passwordTextField.attributedPlaceholder =  NSAttributedString(string:passwordTextField.placeholder != nil ? passwordTextField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: errorColor])
    }
}
