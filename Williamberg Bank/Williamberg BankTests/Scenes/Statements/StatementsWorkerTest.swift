//
//  StatementsWorkerTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 01/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import Foundation
import Mockingjay
import XCTest

class StatementsWorkerTest: XCTestCase {

    var sut: StatementsWorker!
    
    override func setUp()
    {
      super.setUp()
        sut = StatementsWorker()
    }
    
    func testFetchStatementsSuccess(){
        let json = """
                    {
                    "statementList": [
                        {
                            "title": "Pagamento",
                            "desc": "Conta de luz",
                            "date": "2018-08-15",
                            "value": -50
                        },
                        {
                            "title": "TED Recebida",
                            "desc": "Joao Alfredo",
                            "date": "2018-07-25",
                            "value": 745.03
                        }
                        ]
                    }
                """
        stub(uri(BaseBankAPI().baseUrl + "statements/0"), jsonData( json.data(using: .utf8)!))
        let statementsSuccess = XCTestExpectation(description: "statements success expectation")
        sut.fetchStatements(userId: 0, completionHandler: {
            statements, errorMessage in
            XCTAssertNotNil(statements)
            XCTAssertNil(errorMessage)
            statementsSuccess.fulfill()
        })
        wait(for: [statementsSuccess], timeout: 10.0)
    }
    
    func testFetchStatementsSuccessEmpty(){
        let json = """
                    {
                    }
                """
        stub(uri(BaseBankAPI().baseUrl + "statements/0"), jsonData( json.data(using: .utf8)!))
        let statementsSuccess = XCTestExpectation(description: "statements success expectation")
        sut.fetchStatements(userId: 0, completionHandler: {
            statements, errorMessage in
            XCTAssertNil(statements)
            XCTAssertNil(errorMessage)
            statementsSuccess.fulfill()
        })
        wait(for: [statementsSuccess], timeout: 10.0)
    }
    
    func testStatementsFailJsonFormatter(){
        let json = """
                    {
                        ,
                    }
                    """
        stub(uri(BaseBankAPI().baseUrl + "statements/0"), jsonData( json.data(using: .utf8)!))
        let statementsFail = XCTestExpectation(description: "statements fail expectation")
        sut.fetchStatements(userId: 0, completionHandler: {
            statements, errorMessage in
            XCTAssertNil(statements)
            XCTAssertNotNil(errorMessage)
            statementsFail.fulfill()
        })
        wait(for: [statementsFail], timeout: 10.0)
    }
    
    func testStatementsWithResponseError(){
        let error = NSError(domain: BaseBankAPI().baseUrl + "statements/0", code: 10, userInfo: nil)
        stub(uri(BaseBankAPI().baseUrl + "statements/0"), failure(error))
        let statementsFail = XCTestExpectation(description: "statements fail with error expectation")
        sut.fetchStatements(userId: 0, completionHandler: {
            statements, errorMessage in
            XCTAssertNil(statements)
            XCTAssertNotNil(errorMessage)
            statementsFail.fulfill()
        })
        wait(for: [statementsFail], timeout: 10.0)
    }
    
    func testStatementsWithNoData(){
        stub(uri(BaseBankAPI().baseUrl + "statements/0"), {
            request in
              let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return .success(response, .noContent)
        })
        let statementsFailNoData = XCTestExpectation(description: "statements fail no data expectation")
        sut.fetchStatements(userId: 0, completionHandler: {
            statements, errorMenssage in
            XCTAssertNil(statements)
            XCTAssertNotNil(errorMenssage)
            statementsFailNoData.fulfill()
        })
        wait(for: [statementsFailNoData], timeout: 10.0)
    }
    
}
