//
//  ExtensionTest.swift
//  BankAppTests
//
//  Created by Victor Lisboa on 26/09/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class ExtensionTests: XCTestCase {

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
    
    func testSenhaLetraMaiuscula() {
        let password = "test@1"
        XCTAssertFalse(password.validaSenha())
    }
    
    func testSenhaCaracterEspecial() {
        let password = "Test1"
        XCTAssertFalse(password.validaSenha())
    }
    
    func testSenhaNumero() {
        let password = "Test@"
        XCTAssertFalse(password.validaSenha())
    }
    
    func testSenhaLetras() {
        let password = "@1"
        XCTAssertFalse(password.validaSenha())
    }
    
    func testFormataData() {
        var data = "2019-09-24"
        data = data.formataData()
        XCTAssertEqual(data, "24/09/2019")
    }
    
    func testSeparaDigito() {
        var conta = "12345"
        conta = conta.separarDigito()
        XCTAssertEqual(conta, "1234-5")
    }
    
    func testIsEmail() {
        let email = "Test@clean.swift"
        XCTAssertTrue(email.isEmail())
    }
    
    func testIsCPF() {
        let cpf = "123.456.789-09"
        XCTAssertTrue(cpf.isCPF())
    }
    
    func testFormataMoeda() {
        let valor = -11.25
        XCTAssertNotEqual(valor.formataMoeda(), "R$ -11,25")
    }
}
