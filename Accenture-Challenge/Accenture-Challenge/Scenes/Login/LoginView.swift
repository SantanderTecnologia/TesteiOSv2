//
//  LoginView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import SnapKit

enum LoginViewState {
    case normal
    case loading
    case error(String)
}

class LoginView: UIView {
    
    private unowned var userTextField: UITextField
    private unowned var passwordTextField: UITextField
    private unowned var loginButton: UIButton
    private unowned var errorLbl: UILabel
    private unowned var activityView: UIActivityIndicatorView
    
    private lazy var logoImageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    var state: LoginViewState = .normal {
        didSet {
            switch state {
            case .normal:
                handleNormal()
                break
            case .error(let error):
                handleError(error)
                break
            case .loading:
                handleLoading()
            }
        }
    }
    
    init(frame: CGRect,
         userTextField: UITextField,
         passwordTextField: UITextField,
         loginButton: UIButton,
         errorLbl: UILabel,
         activityView: UIActivityIndicatorView) {
        self.userTextField = userTextField
        self.passwordTextField = passwordTextField
        self.loginButton = loginButton
        self.errorLbl = errorLbl
        self.activityView = activityView
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Could not load view")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

extension LoginView {
    
    private func handleLoading() {
        activityView.isHidden = false
        errorLbl.isHidden = true
    }
    
    private func handleError(_ errorMessage: String) {
        activityView.isHidden = true
        errorLbl.isHidden = false
        errorLbl.text = errorMessage
    }
    
    private func handleNormal() {
        DispatchQueue.main.async {
            self.activityView.isHidden = true
            self.errorLbl.isHidden = true
        }
    }
}

extension LoginView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(logoImageView)
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
//        addSubview(activityView)
        addSubview(errorLbl)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
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
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(202)
        }
//        activityView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        errorLbl.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.left.right.equalTo(userTextField)
            make.height.equalTo(60)
        }
    }
    
    func configureViews() {
        backgroundColor = Login.Constants.Colors.backgroundColor
        errorLbl.isHidden = false
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = Login.Constants.Images.logoImageView
        
        userTextField.backgroundColor = Login.Constants.Colors.textFieldBackgroundColor
        userTextField.layer.borderWidth = 1
        userTextField.layer.borderColor = Login.Constants.Colors.textFieldLayerColor.cgColor
        userTextField.layer.cornerRadius = 4
        userTextField.attributedPlaceholder = NSAttributedString(string: Login.Constants.Texts.userTextFieldPlaceHolder,
                                                                 attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.userTextFieldFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.textFieldPlaceHolderColor])
        
        passwordTextField.backgroundColor = Login.Constants.Colors.textFieldBackgroundColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = Login.Constants.Colors.textFieldLayerColor.cgColor
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.isSecureTextEntry = true
        passwordTextField.attributedPlaceholder = NSAttributedString(string: Login.Constants.Texts.passwordTextFieldPlaceHolder,
                                                                     attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.userTextFieldFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.textFieldPlaceHolderColor])

        loginButton.setAttributedTitle(NSAttributedString(string: Login.Constants.Texts.loginButton,
                                                          attributes: [NSAttributedString.Key.font: Login.Constants.Fonts.loginButtonFont, NSAttributedString.Key.foregroundColor: Login.Constants.Colors.loginButtonTextColor]), for: .normal)
        loginButton.backgroundColor = Login.Constants.Colors.loginButtonBackgroundColor
        loginButton.layer.cornerRadius = 4
        
        errorLbl.textColor = .red
        errorLbl.textAlignment = .center
        
        activityView.backgroundColor = Login.Constants.Colors.loginButtonTextColor
        activityView.color = .white
        activityView.startAnimating()
    }
}
