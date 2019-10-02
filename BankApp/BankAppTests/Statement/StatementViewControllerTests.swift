//
//  StatementViewControllerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class StatementViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //Função para capturar a viewController que está sendo usada e suas propriedades
    func getViewController(loading: Bool) -> StatementViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "Statement")
            as? StatementViewController else {
                return nil
        }
        
        if loading {
            //Dados de cabeçalho/usuario mockados
            let user = User(userId: 1, name: "Teste Mockado", bankAccount: "123", agency: "456", balance: 123)
            vc.router?.dataStore?.user = user
            vc.beginAppearanceTransition(true, animated: false)
            
            let _ = vc.view // Isso vai chamar o viewDidLoad
        }
        
        return vc
    }
    
    //Verifica se a view abriu corretamente
    func testLoading() {
        guard let vc = getViewController(loading: true) else { fail() ; return }

        XCTAssertNotNil(vc)
    }
    
    //Teste da tableview que foi criada para exibição dos dados de extrato
    func testTableViewDataSource() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        let sections = vc.numberOfSections(in: vc.tableView)
        
        XCTAssert(sections == 1,
                  "Há apenas uma sessão")
        
        let statementTest1 = StatementUser.init(title: "Teste 1", desc: "Teste 1", date: "Teste 1", value: 01.2)
        let statementTest2 = StatementUser.init(title: "Teste 2", desc: "Teste 2", date: "Teste 2", value: 02.3)
        
        let statements = [statementTest1, statementTest2]
        vc.listStatements = statements

        let rows = vc.tableView(vc.tableView, numberOfRowsInSection: 0)

        XCTAssert(rows == vc.listStatements.count,
                  "Deve ser igual ao listStatements.count")
    }
    
    //Teste para verificar se a tabela existe
    func testHasATableView() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        XCTAssertNotNil(vc.tableView)
    }

    //Teste para verificar se a tabela tem delegate
    func testTableViewHasDelegate() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        XCTAssertNotNil(vc.tableView.delegate)
    }

    //Teste para verificar se a tabela tem datasource
    func testTableViewHasDataSource() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        XCTAssertNotNil(vc.tableView.dataSource)
    }
    
    //Teste para verificar se a tabela tem identificador de celula (e se está de acordo com o configurado)
    func testTableViewCellHasReuseIdentifier() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        let statementTest1 = StatementUser.init(title: "Teste 1", desc: "Teste 1", date: "2019-09-26", value: 01.2)
        let statementTest2 = StatementUser.init(title: "Teste 2", desc: "Teste 2", date: "2019-09-20", value: 02.3)
        
        let statements = [statementTest1, statementTest2]
        vc.listStatements = statements
        
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? StatementCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "celulaReuso"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    //Teste para verificar se a celula tem o conteudo correto na tabela
    func testTableCellHasCorrectLabelText() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        let statementTest1 = StatementUser.init(title: "Teste 1", desc: "Teste 1", date: "2019-09-26", value: 01.2)
        let statementTest2 = StatementUser.init(title: "Teste 2", desc: "Teste 2", date: "2019-09-20", value: 02.3)
        
        let statements = [statementTest1, statementTest2]
        vc.listStatements = statements
        
        let cell0 = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? StatementCell
        XCTAssertEqual(cell0?.txt_titulo.text, "Teste 1")
        XCTAssertEqual(cell0?.txt_descricao.text, "Teste 1")
        XCTAssertEqual(cell0?.txt_data.text, "26/09/2019")
        XCTAssertEqual(cell0?.txt_valor.text, "R$ 1,20")
        
        let cell1 = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? StatementCell
        XCTAssertEqual(cell1?.txt_titulo.text, "Teste 2")
        XCTAssertEqual(cell1?.txt_descricao.text, "Teste 2")
        XCTAssertEqual(cell1?.txt_data.text, "20/09/2019")
        XCTAssertEqual(cell1?.txt_valor.text, "R$ 2,30")
    }
    
    //Verifica se os campos do header estão preenchidos corretamente
    func testHeader() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        XCTAssertEqual(vc.txt_name.text, "Teste Mockado")
        XCTAssertEqual(vc.txt_balance.text, "R$ 123,00")
        XCTAssertEqual(vc.txt_bank_agency.text, "123 / 456")
    }
}
