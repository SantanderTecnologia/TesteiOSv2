//
//  LoginPresenter.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresentationLogic {
    func presentAlert(title: String, message: String)
    func presentLoadingIndicator()
    func dismissLoadingIndicator(completion: (() -> Void)?)
    func erasePasswordTextField()
    func route(userAccount: UserAccount)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: K.LoginScene.ok, style: .cancel, handler: nil))
        self.viewController?.displayAlert(alert: alertController)
    }
    
    func presentLoadingIndicator() {
        let alertController = UIAlertController(title: nil, message: K.LoginScene.connecting, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.style = .gray
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        alertController.view.addSubview(loadingIndicator)
        self.viewController?.displayAlert(alert: alertController)
    }
    
    func erasePasswordTextField() {
        self.viewController?.displayNoPassword()
    }
    
    func dismissLoadingIndicator(completion: (() -> Void)?) {
        self.viewController?.dismissAlert(completion: completion)
    }
    
    func route(userAccount: UserAccount) {
        self.viewController?.routeToAccountViewController(userAccount: userAccount)
    }
}
