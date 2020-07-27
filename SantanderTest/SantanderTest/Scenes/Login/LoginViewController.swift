//
//  LoginViewController.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol LoginDisplayLogic: class {
    func displayAccountDetail()
    func displayError(title: String, message: String)
    func displayLoading(_ isLoading: Bool)
    func displaySaved(user: String, and password: String)
}

class LoginViewController: ViewController {
    
    //MARK: -
    //MARK: - VIEW PROPERTIES
    private var logoImageView: UIImageView!
    private var stackView: UIStackView!
    private var userTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    
    //MARK: -
    //MARK: - SCENE PROPERTIES
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    
    //MARK: -
    //MARK: - VIEW LIFE CYCLE
    override func prepareViews() {
        logoImageView = .init()
        stackView = .init()
        userTextField = .init()
        passwordTextField = .init()
        loginButton = .init()
    }
    
    override func addViewHierarchy() {
        stackView.addArrangedSubviews([
            userTextField,
            passwordTextField
        ])
        
        view.addSubviews([
            logoImageView,
            stackView,
            loginButton
        ])
    }
    
    override func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(60)
        }
        
        userTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(logoImageView)
            make.centerY.equalToSuperview().offset(-60)
            make.left.right.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(stackView)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
            make.width.equalTo(190)
        }
    }
   
    override func configureViews() {
        view.backgroundColor = .white
        configureLogoImageView()
        configureStackView()
        configureTextFields()
        configureLoginButton()
        configureLoginScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.checkForSavedUser()
    }
    
    //MARK: -
    //MARK: - CONFIGURE SCENE
    private func configureLoginScene() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataSource = interactor
    }
    
    //MARK: -
    //MARK: - CONFIGURE LOGO IMAGEVIEW
    private func configureLogoImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        logoImageView.image = UIImage(named: "logo")
    }
    
    //MARK: -
    //MARK: - CONFIGURE STACKVIEW
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }
    
    //MARK: -
    //MARK: - CONFIGURE TEXTFIELDS
    private func configureTextFields() {
        userTextField.placeholder = Strings.Login.Placeholder.loginUser
        userTextField.borderStyle = .roundedRect
        userTextField.autocapitalizationType = .none
        
        passwordTextField.placeholder = Strings.Login.Placeholder.loginPassword
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
    }
    
    //MARK: -
    //MARK: - CONFIGURE TEXTFIELDS
    private func configureLoginButton() {
        loginButton.backgroundColor = Constants.Palette.defaultColor
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle(Strings.Login.Button.loginButton, for: .normal)
        loginButton.layer.cornerRadius = 4
        loginButton.addTarget(self, action: #selector(loginButtonTapped(_ :)), for: .touchUpInside)
    }
    
    //MARK: -
    //MARK: - HANDLE LOGIN BUTTON
    @objc private func loginButtonTapped(_ sender: UIButton) {
        let reques = Login.Request(user: userTextField.text ?? "", password: passwordTextField.text ?? "")
        interactor?.login(with: reques)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

//MARK: -
//MARK: - DISPLAY LOGIC
extension LoginViewController: LoginDisplayLogic {
    
    func displayAccountDetail() {
        router?.routeToDetail()
    }
    
    func displayError(title: String, message: String) {
        presentAlert(with: title, and: message)
    }
    
    func displayLoading(_ isLoading: Bool) {
        if isLoading {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func displaySaved(user: String, and password: String) {
        userTextField.text = user
        passwordTextField.text = password
    }
}
