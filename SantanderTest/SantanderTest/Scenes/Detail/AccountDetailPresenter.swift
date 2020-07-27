//
//  AccountDetailPresenter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol AccountDetailPresentationLogic {
    func onError(title: String, message: String)
    func shouldPresentLoading(_ isLoading: Bool)
    func presentData()
    func performLogout()
}

class AccountDetailPresenter: AccountDetailPresentationLogic {
    weak var viewController: AccountDetailDisplayLogic?
    
    //MARK: -
    //MARK: - PRESENTATION LOGIC
    func onError(title: String, message: String) {
        viewController?.displayError(title: title, message: message)
    }
    
    func shouldPresentLoading(_ isLoading: Bool) {
        viewController?.displayLoading(isLoading)
    }
    
    func presentData() {
        viewController?.displayData()
    }
    
    func performLogout() {
        viewController?.displayLogin()
    }
}
