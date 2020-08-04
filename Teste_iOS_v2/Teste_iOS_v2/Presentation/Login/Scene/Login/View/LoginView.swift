//
//  LoginView.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 31/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func didTapLoginButton(username: String?, password: String?)
}

class LoginView: UIView, NibLoadable {
    
    @IBOutlet private(set) weak var userTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var loginButton: UIButton!
    @IBOutlet private(set) weak var loginButtonBottomConstraint: NSLayoutConstraint!
    
    private let loginButtonBottomConstant: CGFloat = 33
    weak var delegate: LoginViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loginButton.layer.cornerRadius = 4
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func commomInit() {
        setupFromNib()
        addObservables()
        addTargets()
    }
    
    private func addObservables() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addTargets() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginButtonBottomConstraint.constant = keyboardSize.height
            animateView()
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        loginButtonBottomConstraint.constant = loginButtonBottomConstant
        animateView()
    }
    
    @objc private func loginButtonAction() {
        delegate?.didTapLoginButton(username: userTextField.text, password: passwordTextField.text)
    }
    
    private func animateView() {
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    func changeUserInTextField(_ user: String) {
        userTextField.text = user
    }
    
}
