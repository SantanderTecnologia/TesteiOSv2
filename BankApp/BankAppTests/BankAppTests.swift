//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 23/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class BankAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Função que valida a inicialização do Model de Usuario
    func testInitializationUser() {
        let user = User(userId: 1, name: "Teste Mockado", bankAccount: "123", agency: "456", balance: 123)
        
        XCTAssert(user.userId == 1,
                  "UserId deve ser igual a 1 (o que foi mockado)")
        XCTAssert(user.name == "Teste Mockado",
                  "Name deve ser igual a Teste Mockado (o que foi mockado)")
        XCTAssert(user.bankAccount == "123",
                  "Name deve ser igual a 123 (o que foi mockado)")
        XCTAssert(user.agency == "456",
                  "Name deve ser igual a 456 (o que foi mockado)")
        XCTAssert(user.balance == 123,
                  "Name deve ser igual a 123 (o que foi mockado)")
    }
    
    //Função que valida a inicialização do Model de Extrato
    func testInitializationStatement() {
        let statement = StatementUser(title: "Pagamento", desc: "Descrição", date: "25/09/2019", value: 20)
        
        XCTAssert(statement.title == "Pagamento",
                  "Title deve ser igual a Pagamento (o que foi mockado)")
        XCTAssert(statement.desc == "Descrição",
                  "Desc deve ser igual a Descrição (o que foi mockado)")
        XCTAssert(statement.date == "25/09/2019",
                  "Date deve ser igual a 25/09/2019 (o que foi mockado)")
        XCTAssert(statement.value == 20,
                  "Value deve ser igual a 20 (o que foi mockado)")
    }
    
    //Função que valida uma senha 100% valida
    func testValidPassword() {
        let password = "Test@2" //Senha correta
        XCTAssertEqual(password.validaSenha(), true)
    }
    
    //Função que valida que uma senha sem letra maiuscula retorna FALSE
    func testValidPassword_NoUppercase() {
        let password = "test@2" //Senha sem a letra maiuscula
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida que uma senha sem caracter especial retorna FALSE
    func testValidPassword_NoSpecialCharacter() {
        let password = "Test2" //Senha sem o caracter especial
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida que uma senha sem numero retorna FALSE
    func testValidPassword_NoNumber() {
        let password = "Test@" //Senha sem o numero
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida se determinada string só contem numeros
    func testIsNumber() {
        let number = "342423423"
        XCTAssertEqual(number.isNumber(), true)
    }
    
    //Função que valide se determinada string que deveria conter somente numeros, há alguma letra (retorna FALSE)
    func testIsNotNumber() {
        let number = "432jbjh432"
        XCTAssertEqual(number.isNumber(), false)
    }
    
    //Função que garante que a data sempre estará no formato dd/MM/yyyy se a entrada for yyyy/MM/dd
    func testDateFormatter() {
        let date = "2019-09-23"
        XCTAssertEqual(date.formataData(), "23/09/2019")
    }
    
    //Função que garante que o retorno da moeda sempre será no formato R$ XX,YY (com duas casas decimais) para campos double
    func testMoneyFormatter() {
        let money = 2.35
        XCTAssertEqual(money.formataMoeda(), "R$ 2,35")
    }
}
