//
//  BaseBankAPITest.swift
//  Williamberg BankTests
//
//  Created by padrao on 31/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

@testable import Williamberg_Bank
import Foundation
import XCTest

class BaseBankAPITest: XCTestCase {

    func testMakeRequest(){
        let urlErrorExpectation = XCTestExpectation(description: "url error expectation")
        BaseBankAPI().makeRequest(serviceName: "{", args: nil, httpMethod: .POST, completionHandler: {
            data, response, error in
            XCTAssertNotNil(error)
            urlErrorExpectation.fulfill()
        })
        
        let successExpectation = XCTestExpectation(description: "success expectation")
        BaseBankAPI().makeRequest(serviceName: "login", args: nil, httpMethod: .POST, completionHandler: {
            data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            successExpectation.fulfill()
        })
        
        let successWithArgsExpectation = XCTestExpectation(description: "success with args expectation")
        BaseBankAPI().makeRequest(serviceName: "login", args: ["user": "", "password": ""], httpMethod: .POST, completionHandler: {
            data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            successWithArgsExpectation.fulfill()
        })
        
        wait(for: [urlErrorExpectation, successExpectation, successWithArgsExpectation], timeout: 10.0)
    }
    
    func testServiceErrorEnum(){
        XCTAssertEqual(BaseBankAPI.ServiceError.NullResponse.localizedDescription, "Resposta nula recebida do servidor.")
    }
    
}
