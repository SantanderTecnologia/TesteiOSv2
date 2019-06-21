//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 13/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
@testable import TesteiOS

class TesteiOSTests: XCTestCase {

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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testeEmailValidation() {
        XCTAssertFalse("teste".isValidEmail)
        XCTAssertFalse("teste@".isValidEmail)
        XCTAssertFalse("teste@teste".isValidEmail)
        XCTAssertTrue("teste@teste.com".isValidEmail)
        XCTAssertTrue("teste@teste.com.br".isValidEmail)
    }
    
    func testeCpfValidation() {
        XCTAssertFalse("1".isValidCpf)
        XCTAssertFalse("123.123".isValidCpf)
        XCTAssertFalse("123.1233.322-00".isValidCpf)
        XCTAssertFalse("a".isValidCpf)
        XCTAssertTrue("94709220000".isValidCpf)
        XCTAssertTrue("800.444.980-80".isValidCpf)
    }
    
    func testPasswordValidation() {
        XCTAssertFalse("t".isValidPassword)
        XCTAssertFalse("teste".isValidPassword)
        XCTAssertFalse("teste1".isValidPassword)
        XCTAssertFalse("teste123".isValidPassword)
        XCTAssertFalse("Teste".isValidPassword)
        XCTAssertTrue("Teste@123".isValidPassword)
    }
    
    func testDataConverter() {
        XCTAssertEqual("2".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "")
        XCTAssertEqual("2019-".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "")
        XCTAssertEqual("2019-06".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "")
        XCTAssertEqual("2019-06-".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "")
        XCTAssertEqual("2019-06-14".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "14/06/2019")
        XCTAssertEqual("14-06-2019".convertoToDate(input: "dd-MM-yyyy", output: "dd/MM/yyyy"), "14/06/2019")
        XCTAssertEqual("2019-06-16".convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy"), "16/06/2019")
    }
    
    func testBankAccountFormatter() {
        XCTAssertTrue(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "012314564".bankAccountFormatter()))
        XCTAssertTrue(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "0124564".bankAccountFormatter()))
        XCTAssertFalse(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "01".bankAccountFormatter()))
        XCTAssertFalse(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "01.2456".bankAccountFormatter()))
        XCTAssertFalse(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "".bankAccountFormatter()))
        XCTAssertFalse(NSPredicate(format: "SELF MATCHES %@", "^[0-9]{2}.[0-9]*-[0-9]{1}").evaluate(with: "a".bankAccountFormatter()))
        
        
        
    }

}
