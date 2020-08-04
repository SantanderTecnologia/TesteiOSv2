//
//  LoginCoordinator+LoginViewControllerDelegate.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func showError(_ controller: UIViewController)
    func didMadeLogin(model: LoginModels.Response)
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func showError(_ controller: UIViewController) {
        showError(controller: controller)
    }
    
    func didMadeLogin(model: LoginModels.Response) {
        didFinishLoginFlow(model: model)
    }
}
