//
//  AccountDetailsWorkerTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class StatementsWorkerTest: XCTestCase {

      var sut: AccountDetailsWorker!
        
      override func setUp() {
          super.setUp()
          setupStatementsWorker()
      }
        
      func setupStatementsWorker() {
          sut = AccountDetailsWorker()
      }
          
      func testFetchStatement() {
          let expectation = XCTestExpectation(description: "fetching request")
      
          sut.fetchStatements(completionSuccess: { (response) in
              XCTAssertNotNil(response)
              expectation.fulfill()
          }, completionFailure: { (_) in })
          
          wait(for: [expectation], timeout: 30.0)
      }
}
