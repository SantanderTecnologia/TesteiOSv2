//
//  StatementViewControllerTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class StatementViewControllerTests: XCTestCase {
    
    var controller: StatementsViewController?
    
    private func createStatementsVC() -> StatementsViewController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let statementsViewController = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as! StatementsViewController
        _ = statementsViewController.view
        return statementsViewController
    }
    
    override func setUp() {
        controller = createStatementsVC()
    }
    
    func testPopulateTableView() {
        var statements = Statements.StatementList.ViewModel(statements: [])
        for _ in 0...9 {
            statements.statements.append(Statements.StatementList.Statement(transaction: "Pagamento", description: "Cartao", date: "2018-02-12", value: "R$ 36.65"))
        }
        controller?.displayFetchedStatements(viewModel: statements)
        XCTAssert(controller!.tableView(controller!.tableView, numberOfRowsInSection: 0) == 10)
    }
    
    func testPopulateCell() {
        var statements = Statements.StatementList.ViewModel(statements: [])
        for _ in 0...9 {
            statements.statements.append(Statements.StatementList.Statement(transaction: "Pagamento", description: "Cartao", date: "2018-02-12", value: "R$ 36.65"))
        }
        controller!.statements = statements
        let cell = controller!.tableView(controller!.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(cell is StatementViewCell && (cell as! StatementViewCell).transaction.text == "Pagamento")
    }
    
    func testPopulateUserData() {
        let router = StatementsRouter()
        controller!.router = router
        router.dataStore = StatementsDataStoreSpy()
        
        controller?.fillUserData()
        
        XCTAssert(controller!.name.text == "Joao dos testes")
    }
    
    func testNavigateBackToLogin() {
        controller?.logout("")
        //TODO: Como checar se a navegacao foi executada?
    }
    
    //Falta da classe o prepareForSegue
    
}
