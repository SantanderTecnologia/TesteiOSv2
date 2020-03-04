//
//  LoginViewController.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol LoginDisplayLogic: class
{
    func routeToDashboard(source: LoginDataStore)
    func showSession(session: Login.Request)
}

class LoginViewController: UIViewController, LoginDisplayLogic, ErrorDisplayLogic {
    @IBOutlet private var userTextField: BTTextField!
    @IBOutlet private var passwordTextField: BTTextField!

    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchSession()
    }

    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func performLogin() {
        let loginRequest = Login.Request(user: self.userTextField.text,
                                         password: self.passwordTextField.text)
        interactor?.performLogin(request: loginRequest)
    }

    func showSession(session: Login.Request) {
        userTextField.text = session.user
        passwordTextField.text = session.password
    }

    func routeToDashboard(source: LoginDataStore) {
        router?.routeToDashboard(source: source)
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            return passwordTextField.becomeFirstResponder()
        }
        return view.endEditing(true)
    }
}
