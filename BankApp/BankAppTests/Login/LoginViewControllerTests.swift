//
//  LoginViewControllerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    //Função para capturar a viewController que está sendo usada e suas propriedades
    func getViewController(loading: Bool) -> LoginViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "Login")
            as? LoginViewController else {
                return nil
        }
        
        if loading {
            let _ = vc.view //Chamou a view
        }
        
        return vc
    }
    
    //Função para a função de login (clique do botão)
    func testLoginAction() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        vc.txt_user.text = "teste@teste.com.br"
        vc.txt_password.text = "Teste1@"
        
        XCTAssertNotNil(vc.doLogin())
    }
    
    //Função para testar se a tela está sendo chamada corretamente (com os campos)
    func testLoading() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        XCTAssert(vc.txt_user != nil,
                  "Campo de usuario criado")
        XCTAssert(vc.txt_password != nil,
                  "Campo de senha criado")
    }
}
