//
//  LoginRouter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

typealias LoginRouterProtocol = NSObject & LoginRoutingLogic & LoginDataTransfer

protocol LoginRoutingLogic {
    func routeToPayments()
}

protocol LoginDataTransfer {
    var dataStore: LoginDataStore? { get set }
}

class LoginRouter: NSObject, LoginDataTransfer {
    
    var dataStore: LoginDataStore?
    weak var viewController: LoginViewController?
    
    func present(_ vc: UIViewController) {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func transferDataToPayments(source: LoginDataStore, to: inout PaymentsDataStore) {
        guard let data = dataStore?.loginResponse else { return }
        let userAccount = Payments.Received.UserAccount(userId: data.userId,
                                                        name: data.name,
                                                        bankAccount: data.bankAccount,
                                                        agency: data.agency,
                                                        balance: data.balance)
        to.userAccount = userAccount
    }

}

extension LoginRouter: LoginRoutingLogic {
    
    func routeToPayments() {
        let paymentsVC = PaymentsViewController()
        guard let dataStore = dataStore,
                var paymentsDataStore = paymentsVC.router?.dataStore else {
            return
        }
        transferDataToPayments(source: dataStore, to: &paymentsDataStore)
        present(paymentsVC)
    }
}
