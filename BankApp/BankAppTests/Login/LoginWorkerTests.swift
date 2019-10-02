//
//  LoginWorkerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginWorkerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //Função que testa o response do worker/service FUNÇÃO MOCKADO
    func testCompletionHandlerMock() {
        //Inicializa o worker com base no LoginService (onde utilizamos o protocol para fazer a chamada na API)
        var worker: LoginWorker?
        worker = LoginWorker(LoginService())
        
        //Chama a função de login (com os dados de acesso) e configura o response como varivel de retorno
        worker?.mockLogin("teste@teste.com.br", password: "Teste1@") { (response: User?) in
            
            XCTAssertNotNil(response)
            XCTAssert(response?.userId == 1,
                      "É o retorno que está configurado para o UserId na função mockLogin do LoginService")
            XCTAssert(response?.name == "Teste Mockado",
                      "É o retorno que está configurado para o Name na função mockLogin do LoginService")
            XCTAssert(response?.bankAccount == "Banco Mockado",
                      "É o retorno que está configurado para o BankAccount na função mockLogin do LoginService")
            XCTAssert(response?.agency == "Agencia Mockada",
                      "É o retorno que está configurado para o Agency na função mockLogin do LoginService")
            XCTAssert(response?.balance == 200,
                      "É o retorno que está configurado para o Balance na função mockLogin do LoginService")
        }
    }
    
    //Função que testa o response do worker/service
    func testCompletionHandler() {
        //Inicializa o worker com base no LoginService (onde utilizamos o protocol para fazer a chamada na API)
        var worker: LoginWorker?
        worker = LoginWorker(LoginService())
        
        //Chama a função de login (com os dados de acesso) e configura o response como varivel de retorno
        worker?.login("teste@teste.com.br", password: "Teste1@") { (response: User?) in
            
            XCTAssertNotNil(response)
            XCTAssert(response?.userId == 1,
                      "É o retorno que está configurado para o UserId na função login do LoginService")
            XCTAssert(response?.name == "Jose da Silva Teste",
                      "É o retorno que está configurado para o Name na função login do LoginService")
            XCTAssert(response?.bankAccount == "2050",
                      "É o retorno que está configurado para o BankAccount na função login do LoginService")
            XCTAssert(response?.agency == "012314564",
                      "É o retorno que está configurado para o Agency na função login do LoginService")
            XCTAssert(response?.balance == 3.3445,
                      "É o retorno que está configurado para o Balance na função login do LoginService")
        }
    }
    
    //Função que testa se o keychain está funcionando
    func testKeychain() {
        //Inicializa o worker com base no LoginService (onde utilizamos o protocol para fazer a chamada na API)
        var worker: LoginWorker?
        worker = LoginWorker(LoginService())
        
        //Chama a função de login (com os dados de acesso) e configura o response como varivel de retorno
        worker?.mockLogin("teste@teste.com.br", password: "Teste1@") { (response: User?) in
            
            //Remove usuario e senha se já tiver algum
            KeychainService.removePassword(service: "MyUser", account: "BankApp")
            KeychainService.removePassword(service: "MyPass", account: "BankApp")
            
            KeychainService.savePassword(service: "MyUser", account: "BankApp", data: "teste@teste.com.br")
            KeychainService.savePassword(service: "MyPass", account: "BankApp", data: "Teste1@")
            
            if let usuario = KeychainService.loadPassword(service: "MyUser" , account: "BankApp"), let senha = KeychainService.loadPassword(service: "MyPass", account: "BankApp"){
                
                XCTAssert(usuario == "teste@teste.com.br",
                          "Retorno do email utilizado para logar")
                
                XCTAssert(senha == "Teste1@",
                          "Retorno da senha utilizada para logar")
                
            }
        }
    }
}
