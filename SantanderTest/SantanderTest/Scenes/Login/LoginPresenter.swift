//
//  LoginPresenter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func onSuccess()
    func onError(title: String, message: String)
    func shouldPresentLoading(_ isLoading: Bool)
    func shouldPresentSaved(user: String, and password: String)
}

class LoginPresenter: LoginPresentationLogic {
  
    weak var viewController: LoginDisplayLogic?
    
    //MARK: -
    //MARK: - PRESENTATION LOGIC
    func onSuccess() {
        viewController?.displayAccountDetail()
    }
    
    func onError(title: String, message: String) {
        viewController?.displayError(title: title, message: message)
    }
    
    func shouldPresentLoading(_ isLoading: Bool) {
        viewController?.displayLoading(isLoading)
    }
    
    func shouldPresentSaved(user: String, and password: String) {
        viewController?.displaySaved(user: user, and: password)
    }
}
