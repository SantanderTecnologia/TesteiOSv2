//
//  HomeWorkerTest.swift
//  Test BankTests
//
//  Created by Lucas Santana Brito on 25/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import XCTest
@testable import Test_Bank


class HomeWorkerTest: XCTestCase {

    func testCompletionHandler() {
        let worker = HomeWorker()
        let expect = expectation(description: "It should call the completion handler")
        let userId = 1
        var error: Home.ErrorHome?
        var statementResponse: Home.StatementResponse?
        
        worker.getListStatements(userId: userId) { result in
            switch result {
            case .failure(let err):
                error = Home.ErrorHome(code: 0, message: err.localizedDescription)
            case .success(let data):
                if let _ = data.error.message {
                    error = data.error
                } else {
                    statementResponse = data
                }
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (error) in
            print("Timeout error: \(error)")
        }
        
        XCTAssert(error?.code == nil && error?.message == nil,
                  "It should get error == nill")
        if let statementResp = statementResponse {
            XCTAssert(statementResp.statementList.isEmpty == false,
                      "It should get a full list")
        }
        
    }
}
