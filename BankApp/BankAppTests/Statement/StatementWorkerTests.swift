//
//  StatementWorkerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 26/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class StatementWorkerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //Função que testa o response do worker/service - Mockado
    func testCompletionHandlerMock() {
        //Inicializa o worker com base no StatementService (onde utilizamos o protocol para fazer a chamada na API)
        var worker: StatementWorker?
        worker = StatementWorker(StatementService())
        
        //Chama a função de extrato (com o id do usuario logado) e configura o response como varivel de retorno
        worker?.mockStatement(1) { (response: [StatementUser?]) in
            XCTAssertNotNil(response)
            
            XCTAssert(response[0]?.title == "Pagamento",
                        "É o retorno que está configurado para o title na função mockStatment do StatementService")
            XCTAssert(response[0]?.desc == "Descrição",
                        "É o retorno que está configurado para o desc na função mockStatment do StatementService")
            XCTAssert(response[0]?.date == "26/09/2019",
                        "É o retorno que está configurado para o date na função mockStatment do StatementService")
            XCTAssert(response[0]?.value == 123,
                        "É o retorno que está configurado para o value na função mockStatment do StatementService")
        }
    }
    
    //Função que testa o response do worker/service
    func testCompletionHandler() {
        //Inicializa o worker com base no StatementService (onde utilizamos o protocol para fazer a chamada na API)
        var worker: StatementWorker?
        worker = StatementWorker(StatementService())
        
        //Chama a função de extrato (com o id do usuario logado) e configura o response como varivel de retorno
        worker?.getStatement(1) { (response: [StatementUser?]) in
            XCTAssertNotNil(response)
            
            XCTAssert(response[0]?.title == "Pagamento",
                      "É o retorno que está configurado para o title na função getStatement do StatementService")
            XCTAssert(response[0]?.desc == "Conta de luz",
                      "É o retorno que está configurado para o desc na função getStatement do StatementService")
            XCTAssert(response[0]?.date == "2018-08-15",
                      "É o retorno que está configurado para o date na função getStatement do StatementService")
            XCTAssert(response[0]?.value == -50,
                      "É o retorno que está configurado para o value na função getStatement do StatementService")
        }
    }
}
