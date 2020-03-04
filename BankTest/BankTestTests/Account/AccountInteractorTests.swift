//
//  AccountInteractorTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 04/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
@testable import BankTest

class AccountInteractorTests: XCTestCase {

    var accountInteractorSpy: AccountInteractorSpy?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        accountInteractorSpy = AccountInteractorSpy()
    }

    class AccountInteractorSpy: AccountBusinessLogic {
        var statementsCalled = false
        func statements() {
            statementsCalled = true
        }
    }

    func testPerformLoginAndCalledWithSuccess() {
        accountInteractorSpy?.statements()
        assert(accountInteractorSpy?.statementsCalled == true, "Account statement should called")
    }
}
