//
//  TesteiOSv2AccTests.swift
//  TesteiOSv2AccTests
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import XCTest
@testable import TesteiOSv2Acc

class TesteiOSv2AccTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUserValidation(){
        
        XCTAssertFalse(Validator.validate(user: "").isValid())
        XCTAssertFalse(Validator.validate(user: "a").isValid())
        XCTAssertFalse(Validator.validate(user: "abc").isValid())
        XCTAssertFalse(Validator.validate(user: "123").isValid())
        XCTAssertFalse(Validator.validate(user: "aaa@a").isValid())
        XCTAssertFalse(Validator.validate(user: "aaa").isValid())
        XCTAssertFalse(Validator.validate(user: "!@234").isValid())
        XCTAssertFalse(Validator.validate(user: "11111").isValid())
        XCTAssertFalse(Validator.validate(user: "11111111111").isValid())
        XCTAssertFalse(Validator.validate(user: "12345678901").isValid())

     
        XCTAssertTrue(Validator.validate(user: "a@a.com").isValid())
        XCTAssertTrue(Validator.validate(user: "41971628042").isValid())
        XCTAssertTrue(Validator.validate(user: "34987897083").isValid())
        XCTAssertTrue(Validator.validate(user: "sandra@hotmail.com").isValid())
        XCTAssertTrue(Validator.validate(user: "test_149@globo.com").isValid())

    }
    
    func testPasswordValidation(){
        XCTAssertFalse(Validator.validate(password: ""))
        XCTAssertFalse(Validator.validate(password: "a"))
        XCTAssertFalse(Validator.validate(password: "abc"))
        XCTAssertFalse(Validator.validate(password: "123"))
        XCTAssertFalse(Validator.validate(password: "123a"))
        XCTAssertFalse(Validator.validate(password: "abc123"))
        XCTAssertFalse(Validator.validate(password: "Abc123"))
        XCTAssertFalse(Validator.validate(password: "ABC123"))
        XCTAssertFalse(Validator.validate(password: "!@234"))
        XCTAssertFalse(Validator.validate(password: "1a!"))
        
        XCTAssertTrue(Validator.validate(password: "1Ad?"))
        XCTAssertTrue(Validator.validate(password: "A1!"))
        XCTAssertTrue(Validator.validate(password: "Ab!"))
        XCTAssertTrue(Validator.validate(password: "aaaB32@"))
    }
    
    func testCurrencyFormatter()
    {
        let locale = Locale(identifier: "pt-BR")
        
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: -1000.00, locale: locale), "-R$\u{00a0}1.000,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: -1000, locale: locale), "-R$\u{00a0}1.000,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: -99.9, locale: locale), "-R$\u{00a0}99,90")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: -10.0, locale: locale), "-R$\u{00a0}10,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: -10, locale: locale), "-R$\u{00a0}10,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 0, locale: locale), "R$\u{00a0}0,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 10, locale: locale), "R$\u{00a0}10,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 10.0, locale: locale), "R$\u{00a0}10,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 99.9, locale: locale), "R$\u{00a0}99,90")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 1000, locale: locale), "R$\u{00a0}1.000,00")
        XCTAssertEqual(CurrencyHelper.convertToCurrency(value: 1000.00, locale: locale), "R$\u{00a0}1.000,00")
    }
    
    func testFormatAgency(){
        
        let value = "123456"
        
        let formatted = StringHelper.formatBankAccount(bankAccount: value)
        
        XCTAssertEqual(formatted, "12.345-6")
        
        
        let value2 = "123"
        
        let formatted2 = StringHelper.formatBankAccount(bankAccount: value2)
        
        XCTAssertEqual(formatted2, "")
        
        
        let value3 = "1234"
        
        let formatted3 = StringHelper.formatBankAccount(bankAccount: value3)
        
        XCTAssertEqual(formatted3, "12.3-4")
        
        
        let valueError = ""
        
        let formattedError = StringHelper.formatBankAccount(bankAccount: valueError)
        
        XCTAssertEqual(formattedError, "")
    }
    
    func testDateFormatter(){
        
        let expectedOutput = "20/10/2019"
        
        let input = "2019-10-20"
        let inputPattern = "yyyy-MM-dd"
        let outputPattern = "dd/MM/yyyy"
        
        let output = DateHelper.convertDateString(value: input, inputPattern: inputPattern, outputPattern: outputPattern)
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testValidLogin(){
        let request = ServiceRequest.requestForLogin(user: "a@a.com", password: "1!A")
        
        let expectation = self.expectation(description: "Login passed")
        var userAccount: UserAccount? = nil
        var serviceError: ServiceError? = nil
        
        let _ = RestService<LoginResponse>().executeServiceRequest(serviceRequest: request)
        { (response, error) in
            
            userAccount = response?.userAccount
            serviceError = response?.error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(userAccount?.userId != nil)
        XCTAssertTrue(serviceError?.code == nil)
    }
    
    func testInvalidLogin(){
        let request = ServiceRequest.requestForLogin(user: "", password: "")
        
        let expectation = self.expectation(description: "Login passed")
        var userAccount: UserAccount? = nil
        var serviceError: ServiceError? = nil
        
        let _ = RestService<LoginResponse>().executeServiceRequest(serviceRequest: request)
        { (response, error) in
            
            userAccount = response?.userAccount
            serviceError = response?.error
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(userAccount?.userId == nil)
        XCTAssertTrue(serviceError?.code != nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
