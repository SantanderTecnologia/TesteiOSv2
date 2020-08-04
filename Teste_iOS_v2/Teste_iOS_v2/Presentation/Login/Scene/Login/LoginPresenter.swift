//
//  LoginPresenter.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic: AnyObject {
    func presentSuccessLogin(model: LoginModels.Response)
    func presentUncompletedFieldsError()
    func presentWrongFieldsError()
    func presentAuthenticationError()
    func presentLastLoggedUser(_ user: String)
}

extension LoginPresenter: LoginPresentationLogic {
    func presentSuccessLogin(model: LoginModels.Response) {
        viewController?.displaySuccessLogin(model: model)
    }
    
    func presentUncompletedFieldsError() {
        let alert = createAlert(message: StringTables.LocalizedLogin.uncompletedFieldsMessage.string)
        viewController?.displayErrorLogin(alert)
    }
    
    func presentWrongFieldsError() {
        let alert = createAlert(message: StringTables.LocalizedLogin.wrongFieldsMessage.string)
        viewController?.displayErrorLogin(alert)
    }
    
    func presentAuthenticationError() {
        let alert = createAlert(title: StringTables.LocalizedLogin.loginAuthenticationErrorTitle.string,
            message: StringTables.LocalizedLogin.loginAuthenticationErrorMessage.string)
        viewController?.displayErrorLogin(alert)
    }
    
    func presentLastLoggedUser(_ user: String) {
        viewController?.displayLastLoggedUser(user)
    }
}

class LoginPresenter: NSObject {
    weak var viewController: LoginDisplayLogic?
    
    init(viewController: LoginDisplayLogic) {
        self.viewController = viewController
    }
    
    private func createAlert(title: String = StringTables.LocalizedLogin.errorTitle.string,
                             message: String,
                             buttonTitle: String = StringTables.LocalizedLogin.errorButtonTitle.string) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(button)
        return alert
    }
}
