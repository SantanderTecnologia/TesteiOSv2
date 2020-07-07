//
//  PaymentsInteractor+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

@testable import Accenture_Challenge
import XCTest

class PaymentsInteractor_Tests: XCTestCase {

    var sut: PaymentsInteractor!
    
    var viewController: PaymentsDisplayLogic?
    
    var userAccount: Payments.Info.ViewModel.UserAccount?
    var statements: Payments.Info.ViewModel.Payment?
    
    override func setUp() {
        sut = PaymentsInteractor(viewController: PaymentsViewController(),
                                 presenter: self,
                                 worker: PaymentsWorkerMock())
        sut.userAccount = Payments.Received.UserAccount(userId: 1, name: "Pedro",
                                                        bankAccount: "Bank",
                                                        agency: "012345",
                                                        balance: 10.0)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testFetchUserInfo() {
        sut.fetchUserInfo(Payments.Request.UserInfo())
        XCTAssertNotNil(userAccount)
    }
    
    func testFetchStatements() {
        sut.fetchStatements()
        XCTAssertNotNil(statements)
    }
}

extension PaymentsInteractor_Tests: PaymentsPresentationLogic {
    
    func didFetchUserAccount(_ response: Payments.Info.ViewModel.UserAccount) {
        self.userAccount = response
    }
    
    func didFetchStatements(_ response: Payments.Info.ViewModel.Payment) {
        self.statements = response
    }
    
    func didFetchError(_ errorMessage: String) {
        
    }
}
