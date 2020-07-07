//
//  PaymentsPresenter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol PaymentsPresentationLogic {
    var viewController: PaymentsDisplayLogic? { get set }
    
    func didFetchUserAccount(_ response: Payments.Info.ViewModel.UserAccount)
    func didFetchStatements(_ response: Payments.Info.ViewModel.Payment)
    func didFetchError(_ errorMessage: String)
}

class PaymentsPresenter: PaymentsPresentationLogic {
    
    weak var viewController: PaymentsDisplayLogic?
    
    func didFetchUserAccount(_ response: Payments.Info.ViewModel.UserAccount) {
        viewController?.displayUserInfo(response)
    }
    
    func didFetchStatements(_ response: Payments.Info.ViewModel.Payment) {
        viewController?.displayStatements(response)
    }
    
    func didFetchError(_ errorMessage: String) {
        viewController?.displayError(errorMessage)
    }
}
