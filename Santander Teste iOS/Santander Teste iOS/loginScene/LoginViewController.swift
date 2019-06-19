//
//  LoginViewController.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayNoPassword()
    func displayAlert(alert: UIAlertController)
    func dismissAlert(completion: (() -> Void)?)
    func routeToAccountViewController(userAccount: UserAccount)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    let imageLogo = UIImageView()
    let textFieldUser = UITextField()
    let textFieldPassword = UITextField()
    let buttonLogin = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func viewDidLoad() {
        self.addingViews()
        self.setupConstraints()
        self.settingView()
    }
    
    func setup() {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
    
    func settingView() {
        self.view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDown))
        gesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func keyboardDown() {
        self.view.endEditing(true)
    }
    
    @objc func login() {
        self.interactor?.validateLogin(username: self.textFieldUser.text, password: self.textFieldPassword.text)
    }
}

extension LoginViewController: ViewCode {
    func addingViews() {
        self.view.backgroundColor = .white
        self.imageLogo.image = UIImage(named: K.LoginScene.logoImageName)
        self.view.addSubview(self.imageLogo)
        
        self.textFieldUser.text = UserDefaults.standard.string(forKey: K.UserDefaults.lastUserKey)
        self.textFieldUser.borderStyle = .roundedRect
        self.textFieldUser.placeholder = K.LoginScene.user
        self.textFieldUser.returnKeyType = .next
        self.view.addSubview(self.textFieldUser)
        
        self.textFieldPassword.borderStyle = .roundedRect
        self.textFieldPassword.placeholder = K.LoginScene.password
        self.textFieldPassword.returnKeyType = .go
        self.textFieldPassword.isSecureTextEntry = true
        self.view.addSubview(self.textFieldPassword)
        
        self.buttonLogin.setTitle(K.LoginScene.login, for: .normal)
        self.buttonLogin.backgroundColor = K.Colors.mainBlue
        self.buttonLogin.layer.cornerRadius = 5.0
        self.buttonLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(self.buttonLogin)
    }
    
    func setupConstraints() {
        self.imageLogo.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(36)
            make.width.equalTo(125)
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
        }
        
        self.textFieldUser.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(211)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        self.textFieldPassword.snp.makeConstraints { (make) in
            make.top.equalTo(self.textFieldUser.snp.bottom).offset(21)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        self.buttonLogin.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(32)
            make.top.greaterThanOrEqualTo(self.textFieldPassword.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(86)
            make.trailing.equalToSuperview().inset(86)
            make.height.equalTo(62)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    func displayAlert(alert: UIAlertController) {
        self.show(alert, sender: nil)
    }
    
    func dismissAlert(completion: (() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
    }
    
    func displayNoPassword() {
        self.textFieldPassword.text = ""
    }
    
    func routeToAccountViewController(userAccount: UserAccount) {
        self.router?.routeToAccountViewController(userAccount: userAccount)
    }
}
