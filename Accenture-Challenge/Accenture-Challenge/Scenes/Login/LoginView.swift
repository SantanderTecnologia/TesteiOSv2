//
//  LoginView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    private unowned var userTextField: UITextField
    private unowned var passwordTextField: UITextField
    private unowned var loginButton: UIButton
    
    private lazy var logoImageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    init(frame: CGRect,
         userTextField: UITextField,
         passwordTextField: UITextField,
         loginButton: UIButton) {
        self.userTextField = userTextField
        self.passwordTextField = passwordTextField
        self.loginButton = loginButton
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Could not load view")
    }
}

extension LoginView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(logoImageView)
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.centerX.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(125)
        }
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(105)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(21)
            make.left.right.height.equalTo(userTextField)
        }
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(33)
            make.left.right.equalToSuperview().inset(86)
            make.height.equalTo(63)
        }
    }
    
    func configureViews() {
        backgroundColor = Login.Constants.Colors.backgroundColor
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = Login.Constants.Images.logoImageView
        
        userTextField.backgroundColor = Login.Constants.Colors.textFieldBackgroundColor
        userTextField.layer.borderWidth = 1
        userTextField.layer.borderColor = Login.Constants.Colors.textFieldLayerColor.cgColor
        userTextField.layer.cornerRadius = 4
        userTextField.attributedPlaceholder = NSAttributedString(string: Login.Constants.Texts.userTextFieldPlaceHolder, attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.userTextFieldFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.textFieldPlaceHolderColor])
        
        passwordTextField.backgroundColor = Login.Constants.Colors.textFieldBackgroundColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = Login.Constants.Colors.textFieldLayerColor.cgColor
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.attributedPlaceholder = NSAttributedString(string: Login.Constants.Texts.passwordTextFieldPlaceHolder, attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.userTextFieldFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.textFieldPlaceHolderColor])
        
        loginButton.titleLabel?.attributedText = NSAttributedString(string: Login.Constants.Texts.loginButton, attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.loginButtonFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.loginButtonTextColor])
        loginButton.backgroundColor = Login.Constants.Colors.loginButtonBackgroundColor
        loginButton.layer.cornerRadius = 4
    }
}
