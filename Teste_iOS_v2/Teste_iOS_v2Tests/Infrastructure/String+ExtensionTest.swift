//
//  String+ExtensionTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class StringTest: XCTestCase {
    
    func testConvertToSnakeCase() {
        XCTAssertEqual("stringToTest".convertToSnakeCase(), "string_to_test")
        XCTAssertNotEqual("secondStringToTest".convertToSnakeCase(), "second_string_to_test_")
    }
    
    func testCPFValidation() {
        XCTAssert("12345678909".isValidCPF())
        XCTAssertFalse("12312312312".isValidCPF())
    }
    
    func testEmailValidation() {
        XCTAssert("teste@corporativo.com".isValidEmail())
        XCTAssertFalse("teste@iha*$.organizacao".isValidEmail())
    }
    
    func testNumberValidation() {
        XCTAssert("N@2".hasNumbers())
        XCTAssertFalse("N@".hasNumbers())
    }
    
    func testCapitalLettersValidation() {
        XCTAssert("N@2".hasCapitalLetters())
        XCTAssertFalse("n@".hasCapitalLetters())
    }
    
    func testSpecialCharactersValidation() {
        XCTAssert("N@2".hasSpecialCharacters())
        XCTAssertFalse("n3".hasSpecialCharacters())
    }
    
    func testGetDateFromString() {
        XCTAssertNotNil("2018-10-25".getFullDate())
        XCTAssertNil("25-10-2018".getFullDate())
    }
    
    func testAgencyFormatter() {
        XCTAssertEqual("12345".getFormmatedAgency(), "1234-5")
        XCTAssertEqual("1234567890".getFormmatedAgency(), "12.3456789-0")
    }
    
    
}
