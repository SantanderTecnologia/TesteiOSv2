//
//  AccountDetailsPresenter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol AccountDetailsPresentationLogic {
    func logoutUser()
    func presentFetchedStatements(response: AccountDetails.FetchStatements.Response)
    func presentFetchedAccountInfo(response: AccountDetails.FetchAccountInfo.Response)
    func presentErrorMessage(_ message: String)
}

class AccountDetailsPresenter: AccountDetailsPresentationLogic {

    weak var viewController: AccountDetailsDisplayLogic?
    
    func presentFetchedStatements(response: AccountDetails.FetchStatements.Response) {
        var displayedStatements: [AccountDetails.FetchStatements.ViewModel.DisplayedStatement] = []
        
        for statement in response.statementList {
            let title = statement.title
            let desc = statement.desc
            let formattedDate = statement
                .date.convert(fromDateFormat: "yyyy-MM-dd", toDateFormat: "dd/MM/yyyy")
            let formattedValue = abs(statement.value).convertToCurrency()

            let displayedStatement = AccountDetails.FetchStatements.ViewModel.DisplayedStatement(title: title, desc: desc, date: formattedDate ?? "", value: "R$" + (formattedValue ?? "0,00"))
            displayedStatements.append(displayedStatement)
        }
        
        let viewModel = AccountDetails.FetchStatements.ViewModel(displayedStatements: displayedStatements)
        viewController?.displayFetchedStatements(viewModel: viewModel)
    }
    
    func presentFetchedAccountInfo(response: AccountDetails.FetchAccountInfo.Response) {
        
        let accountInfo = response.accountInfo
        
        let displayedAccountInfo = AccountDetails
            .FetchAccountInfo.ViewModel
            .DisplayedAccountInfo(name: accountInfo.name,
                                  account: accountInfo.bankAccount + " / " + accountInfo.agency,
                                  balance: "R$" + (accountInfo.balance.convertToCurrency() ?? "0,00"))
        
        let viewModel = AccountDetails.FetchAccountInfo.ViewModel(displayedAccountInfo: displayedAccountInfo)
        viewController?.displayFetchedAccountInfo(viewModel: viewModel)
    }
    
    func presentErrorMessage(_ message: String) {
        viewController?.displayErrorMessage(message)
    }
    
    func logoutUser() {
        viewController?.logoutUser()
    }
}
