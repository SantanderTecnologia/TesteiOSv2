//
//  TesteIOSTests.swift
//  TesteIOSTests
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
//import UserAccount
@testable import TesteIOS

class LoginTestCase: XCTestCase {
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Testing with valid email
    func test_Valid_Email(){
        let email  = "user@domain.ltv"
        XCTAssertTrue(Validator.isValidEmail(email: email))
    }
    
    // Testing with invalid email
    func test_InValid_Email(){
        let email  = "user@domain"
        XCTAssertFalse(Validator.isValidEmail(email: email))
    }
    
    // Testing with valid CPF
    func test_Valid_CPF(){
        let cpf  = "39728922337"
        XCTAssertTrue(Validator.isValidCPF(cpf: cpf))
    }
    
    // Testing with InValid CPF
    func test_InValid_CPF(){
        let cpf  = "39728922330"
        XCTAssertFalse(Validator.isValidCPF(cpf: cpf))
    }
    
    // Testing with invalid password without special characters
    func test_Password_Not_Have_special_characters(){
        let password  = "1122AAaa"
        XCTAssertFalse(Validator.isValidEmail(email: password))
    }
    
    // Testing with invalid password without numbers
    func test_Password_Not_Have_numbers(){
        let password  = "AAaa@@##"
        XCTAssertFalse(Validator.isValidEmail(email: password))
    }
    
    // Testing with invalid password without capital letters
    func test_Password_Not_Have_Capital_Letters(){
        let password  = "aaaa@@11"
        XCTAssertFalse(Validator.isValidEmail(email: password))
    }
    
    // Testing with invalid password without capital letters
    func test_Valid_Password(){
        let password  = "AAaa@@11"
        XCTAssertFalse(Validator.isValidEmail(email: password))
    }
    
    // Testing CPF digit calator
    func test_Digito_CPF_Valido(){
        let cpf  = "397289223"
        let expected = 3
        XCTAssertEqual(Validator.CalcularDigito(str: cpf, peso: Validator.pesoCPF), expected)
    }
    
    
}
