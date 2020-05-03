//
//  AccountDetailsPresenter.swift
//  santander-challenge
//
//  Created by Kevin Oliveira on 01/05/20.
//  Copyright (c) 2020 Kevin Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDetailsPresentationLogic {
    func presentAccountInfo(response: AccountDetails.AccountInfo.Response)
    func presentStatements(response: AccountDetails.ListStatements.Response)
}

class AccountDetailsPresenter: AccountDetailsPresentationLogic {
    weak var viewController: AccountDetailsDisplayLogic?

    // MARK: Account Info

    func presentAccountInfo(response: AccountDetails.AccountInfo.Response) {
        let agency = String(response.user.agency).applyPattern(pattern: "##.#####-#", replacementCharacter: "#")

        let viewModel = AccountDetails.AccountInfo.ViewModel(
            name: response.user.name,
            accountNumber: "\(response.user.account) / \(agency)",
            balance: response.user.balance.toCurrency()
        )

        viewController?.displayAccountInfo(viewModel: viewModel)
    }

    // MARK: Statements

    func presentStatements(response: AccountDetails.ListStatements.Response) {
        let statements = response.statements.map { (statement) in
            return AccountDetails.ListStatements.StatementViewModel(
                title: statement.title,
                description: statement.description,
                date: statement.date.toString(),
                value: statement.value.toCurrency()
            )
        }

        let viewModel = AccountDetails.ListStatements.ViewModel(
            statements: statements,
            success: response.success
        )

        viewController?.displayStatements(viewModel: viewModel)
    }
}
