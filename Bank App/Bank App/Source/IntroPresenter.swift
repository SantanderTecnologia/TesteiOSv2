//
//  IntroPresenter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

protocol IntroPresentationLogic {
    
    func showHistoryController()
    
    func showError(error: BankError)
}

class IntroPresenter: IntroPresentationLogic {
    
    weak var viewController: IntroDisplayLogic?
    
    func showHistoryController() {
        viewController?.presentDetailController()
    }
    
    func showError(error: BankError) {
        if let errorMessage = error.message {
            buildAlert(title: "ERROR", message: errorMessage)
        }
    }
    
    private func buildAlert(title: String, message: String) {
        print(message)
    }
}
