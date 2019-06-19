//
//  AccountPresenter.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 17/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

protocol AccountPresentationLogic {
    func presentAlert(title: String, message: String)
    func presentUserAccountData(userAccount: UserAccount)
    func reloadTableViewData()
}

class AccountPresenter: AccountPresentationLogic {
    weak var viewController: AccountDisplayLogic?
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: K.AccountScene.sim, style: .default, handler: { (action) in
            self.viewController?.dismissAlert()
        }))
        alertController.addAction(UIAlertAction(title: K.AccountScene.cancelar, style: .cancel, handler: nil))
        self.viewController?.displayAlert(alert: alertController)
    }
    
    func presentUserAccountData(userAccount: UserAccount) {
        let userAccountFormatted = Account.UserAccountFormatted(name: userAccount.name, agencyBankAccount: formatAgencyBankAccount(agency: userAccount.agency, bankAccount: userAccount.bankAccount), saldo: parseSaldoToString(saldo: userAccount.balance))
        self.viewController?.displayUserAccount(userAccount: userAccountFormatted)
    }
    
    func reloadTableViewData() {
        self.viewController?.reloadData()
    }
    
    func formatAgencyBankAccount(agency: String, bankAccount: String) -> String {
        return "\(bankAccount) / \(formatAgency(agency: agency))"
    }
    
    func formatAgency(agency: String) -> String {
        var agency = agency
        agency.insert(".", at: agency.index(agency.startIndex, offsetBy: 2))
        agency.insert("-", at: agency.index(agency.startIndex, offsetBy: 9))
        return agency
    }
    
    func parseSaldoToString(saldo: Float) -> String {
        return String(format: "R$ %.02f", saldo)
    }
}
