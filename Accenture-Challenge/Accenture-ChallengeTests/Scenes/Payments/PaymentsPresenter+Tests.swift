//
//  PaymentsPresenter+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import XCTest
@testable import Accenture_Challenge

class PaymentsPresenter_Tests: XCTestCase {

    var sut: PaymentsPresenter!
    
    var userAccount: Payments.Info.ViewModel.UserAccount?
    var statements: Payments.Info.ViewModel.Payment?
    var errorMessage: String?
    
    override func setUp() {
        sut = PaymentsPresenter()
        sut.viewController = self
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testDidFetchUserAccount() {
        sut.didFetchUserAccount(Payments.Info.ViewModel.UserAccount(name: "Pedro", accountInfo: "01234", balance: "R$ 40000,00"))
        XCTAssertNotNil(userAccount)
    }
    
    func testDidFetchStatements() {
        sut.didFetchStatements(Payments.Info.ViewModel.Payment(model: []))
        XCTAssertNotNil(statements)
    }
    
    func testDidFetchError() {
        sut.didFetchError("Error")
        XCTAssertNotNil(errorMessage)
    }
}

extension PaymentsPresenter_Tests: PaymentsDisplayLogic {
    
    func displayUserInfo(_ viewModel: Payments.Info.ViewModel.UserAccount) {
        self.userAccount = viewModel
    }
    
    func displayStatements(_ viewModel: Payments.Info.ViewModel.Payment) {
        self.statements = viewModel
    }
    
    func displayError(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
}
