//
//  StatementListViewControllerMock.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit
@testable import BankApp

class StatementListViewControllerMock: UIViewController, StatementListDisplayLogic {

    var viewModel: StatementList.Statements.ViewModel? = nil

    func fetchStatementsComplete(viewModel: StatementList.Statements.ViewModel) {
        self.viewModel = viewModel
    }

}
