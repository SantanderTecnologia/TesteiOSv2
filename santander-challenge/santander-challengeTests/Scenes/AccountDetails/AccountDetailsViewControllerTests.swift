//
//  AccountDetailsViewControllerTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

@testable import santander_challenge

import XCTest

// MARK: - Test Doubles

class AccountDetailsInteractorSpy: AccountDetailsBusinessLogic, AccountDetailsDataStore {
    var showAccountInfoCalled = false
    var listStatementsCalled = false
    
    var user: User?
    
    func showAccountInfo(request: AccountDetails.AccountInfo.Request) {
        showAccountInfoCalled = true
    }
    
    func listStatements(request: AccountDetails.ListStatements.Request) {
        listStatementsCalled = true
    }
}

// MARK: - Tests

class AccountDetailsViewControllerTests: XCTestCase {

    func testShowAccountInfoCalledWhenViewDidLoad() {
        // GIVEN
        let interactorSpy = AccountDetailsInteractorSpy()

        let viewController = AccountDetailsViewController()
        viewController.interactor = interactorSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        // WHEN
        viewController.viewDidLoad()

        // THEN
        XCTAssertTrue(interactorSpy.showAccountInfoCalled)
    }

    func testListStatementsCalledWhenViewDidLoad() {
        // GIVEN
        let interactorSpy = AccountDetailsInteractorSpy()

        let viewController = AccountDetailsViewController()
        viewController.interactor = interactorSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        // WHEN
        viewController.viewDidLoad()

        // THEN
        XCTAssertTrue(interactorSpy.listStatementsCalled)
    }
    
    func testDisplayAccountInfo() {
        // GIVEN
        let viewController = AccountDetailsViewController()
        
        let nameLabelSpy = LabelSpy()
        let accountNumberLabelSpy = LabelSpy()
        let balanceLabelSpy = LabelSpy()
        
        viewController.nameLabel = nameLabelSpy
        viewController.accountNumberLabel = accountNumberLabelSpy
        viewController.balanceLabel = balanceLabelSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let viewModel = AccountDetails.AccountInfo.ViewModel(
            name: "Foo Bar",
            accountNumber: "123 / 1.234567-9",
            balance: "R$ 9,90"
        )

        // WHEN
        viewController.displayAccountInfo(viewModel: viewModel)

        // THEN
        XCTAssertEqual(viewController.nameLabel.text, "Foo Bar")
        XCTAssertEqual(viewController.accountNumberLabel.text, "123 / 1.234567-9")
        XCTAssertEqual(viewController.balanceLabel.text, "R$ 9,90")
    }
    
    func testDisplayStatements() {
        // GIVEN
        let viewController = AccountDetailsViewController()

        let statementsTableViewSpy = TableViewSpy()
        viewController.statementsTableView = statementsTableViewSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let statements = [
            AccountDetails.ListStatements.StatementViewModel(
                title: "Foo Bar",
                description: "Bar Baz",
                date: "02/05/2020",
                value: "R$ 9,90"
            )
        ]

        let viewModel = AccountDetails.ListStatements.ViewModel(
            statements: statements,
            success: true
        )

        // WHEN
        viewController.displayStatements(viewModel: viewModel)

        // THEN
        XCTAssertTrue(statementsTableViewSpy.reloadDataCalled)
    }
    
    func testDisplayStatementsWithError() {
        // GIVEN
        let viewController = AccountDetailsViewController()

        let statementsTableViewSpy = TableViewSpy()
        viewController.statementsTableView = statementsTableViewSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let viewModel = AccountDetails.ListStatements.ViewModel(statements: [], success: false)

        // WHEN
        viewController.displayStatements(viewModel: viewModel)

        // THEN
        XCTAssertFalse(statementsTableViewSpy.reloadDataCalled)
    }
    
    func testTableViewNumberOfRows() {
        // GIVEN
        let viewController = AccountDetailsViewController()

        let statementsTableViewSpy = TableViewSpy()
        viewController.statementsTableView = statementsTableViewSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let statements = [
            AccountDetails.ListStatements.StatementViewModel(
                title: "Foo Bar",
                description: "Bar Baz",
                date: "02/05/2020",
                value: "R$ 9,90"
            )
        ]

        viewController.statements = statements
        
        let tableView = viewController.statementsTableView

        // WHEN
        let numberOfRows = viewController.tableView(tableView!, numberOfRowsInSection: 0)
        
        // THEN
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func testTableViewNumberOfRowsWithoutStatements() {
        // GIVEN
        let viewController = AccountDetailsViewController()

        let statementsTableViewSpy = TableViewSpy()
        viewController.statementsTableView = statementsTableViewSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        
        let tableView = viewController.statementsTableView

        // WHEN
        let numberOfRows = viewController.tableView(tableView!, numberOfRowsInSection: 0)

        // THEN
        XCTAssertEqual(numberOfRows, 0)
    }

    func testTableViewHeightForRow() {
        // GIVEN
        let viewController = AccountDetailsViewController()

        let statementsTableViewSpy = TableViewSpy()
        viewController.statementsTableView = statementsTableViewSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        let tableView = viewController.statementsTableView
        let indexPath = IndexPath(row: 0, section: 0)

        // WHEN
        let heightForRow = viewController.tableView(tableView!, heightForRowAt: indexPath)

        // THEN
        XCTAssertEqual(heightForRow, 96)
    }
}
