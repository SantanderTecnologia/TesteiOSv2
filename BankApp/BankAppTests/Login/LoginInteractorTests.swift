//
//  LoginInteractorTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

//Inicialização de classe para mock
class LoginPresentationLogicSpy: LoginPresentationLogic {
    var presentLoginCalled = false
    
    func presentLogin() {
        presentLoginCalled = true
    }
}

//Função para validar chamadas do interactor e serviços
class LoginInteractorTests: XCTestCase {
    
    //Inicializa o interactor utilizado no login
    var sut: LoginInteractor!
    
    override func setUp()
    {
        super.setUp()
        sut = LoginInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    //Teste que verifica se o login deu sucesso (com dados mockados)
    func testSuccessfullLogin() {
        // Given
        let spy = LoginPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        let request = Login.RequestUser.Request(user: "teste@teste.com.br", password: "Teste@2")
        sut.mockLogin(request: request)
        
        //Then
        XCTAssertTrue(spy.presentLoginCalled, "A função de retorno do login na view foi chamada")
    }
}
