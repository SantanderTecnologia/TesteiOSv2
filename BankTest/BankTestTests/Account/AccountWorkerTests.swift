//
//  AccountWorkerTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 04/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
import Moya
@testable import BankTest

class AccountWorkerTests: XCTestCase {

    var accountWorkerSpy: AccountWorkerSpy?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        accountWorkerSpy = AccountWorkerSpy()
    }

    class AccountWorkerSpy: AccountWorkerLogic {

        var statementsCalled = false
        func statements(success: @escaping ((_ response: Account.Response) -> Void), failure: @escaping ((_ error: MoyaError) -> Void)) {
            statementsCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let statement = Statement(title: "", description: "", dateTransaction: nil, value: 0)
                let response = Account.Response(statementList: [statement])
                success(response)
            }
        }
    }

    func testFetchLoginShouldReturnUserAccount() {
        let expect = expectation(description: "Wait for fetched statements result")
        accountWorkerSpy?.statements(success: { (statements) in
            expect.fulfill()
        }, failure: { (_) in

        })

        assert(accountWorkerSpy?.statementsCalled == true, "Calling statements() should return a account.response")
        waitForExpectations(timeout: 2) { (_) in
            assert(true, "Calling statements() should result in the account result with statements handler")
        }
    }
}

