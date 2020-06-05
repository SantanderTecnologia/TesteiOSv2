//
//  BankTests.swift
//  BankTests
//
//  Created by Junior Obici on 15/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import XCTest
@testable import Bank

class BankTests: XCTestCase {

    //MARK: - Default
    override func setUp() {
    }

    override func tearDown() {
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
    
    func testEmailValidated() {
        let email: String = "junior.obici@hotmail.com"
        XCTAssertTrue(Function.validateEmail(email: email), "E-mail válido")
    }
    
    func testEmailInvalidated() {
        let email: String = "junior.obici#hotmail.com"
        XCTAssertFalse(Function.validateEmail(email: email), "E-mail Inválido: Sem o @")
    }
    
    func testEmailInvalidated2() {
        let email: String = "junior.obici@hotmail"
        XCTAssertFalse(Function.validateEmail(email: email), "E-mail Inválido: Sem o sufixo .com")
    }
    
    
    
    func testCpfValidated() {
        let CPF: String = "361.318.758-20"
        XCTAssertTrue(Function.validateCPF(cpf: CPF), "CPF válido")
    }
    
    func testCpfInvalidated() {
        let CPF: String = "123.456.789-00"
        XCTAssertFalse(Function.validateCPF(cpf: CPF), "CPF inválido")
    }
    
    
    
    //Senha Válida
    func testValidatedPassword() {
        let senha: String = "Test@123"
        XCTAssertTrue(Function.validatePassword(password: senha), "Senha válida")
    }
    
    //Senha Inválida
    func testInvalidatedPassword() {
        let senha: String = "T@1"
        XCTAssertFalse(Function.validatePassword(password: senha), "Senha válida")
    }

    //MARK: - Data
    func testDateFormatInTransaction() {
        let data = "2020-01-12"
        XCTAssertEqual(data.toShortDate, "12/01/2020")
    }

    //MARK: - Moeda
    func testCurrencyFormatInTransaction() {
        let valor = 1355.19
        XCTAssertEqual(Decimal(valor).Currency, "R$ 1.355,19")
    }
    
    //MARK: - Agencia
    func testAgencyFormatInTransaction() {
        let agencia: String = "012314564"
        XCTAssertEqual(agencia.toAgency(), "01.231456-4")
    }
    
    //MARK: - Numero
    func testisNumber() {
        let number: String = "5546"
        XCTAssertTrue(number.isNumber(), "É um número")
    }
    
    func testNotIsNumber() {
        let number: String = "abc"
        XCTAssertFalse(number.isNumber(), "Não é um número")
    }
    
    
    func testSaveUserDefault() {
        let user: String = "1234"
        let pass: String = "4321"
        
        //salvar
        UserDefaults.standard.set(user, forKey: "testUser")
        UserDefaults.standard.set(pass, forKey: "testPass")
        
        //obter
        let userSalvo: String = UserDefaults.standard.string(forKey: "testUser")!
        let passSalvo: String = UserDefaults.standard.string(forKey: "testPass")!

        //verificar
        XCTAssertEqual(user, userSalvo)
        XCTAssertEqual(pass, passSalvo)
    }
    
    func testRemoveUserDefault() {
        let user: String = "1234"
        let pass: String = "4321"
        
        //salvar
        UserDefaults.standard.set(user, forKey: "testUser")
        UserDefaults.standard.set(pass, forKey: "testPass")
        
        //remover
        UserDefaults.standard.removeObject(forKey: "testUser")
        UserDefaults.standard.removeObject(forKey: "testPass")
        
        //verificar
        XCTAssertNotEqual(user, "")
        XCTAssertNotEqual(pass, "")
    }
}
