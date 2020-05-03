//
//  AccountDetailsPresenterTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

// MARK: - Test Doubles

class AccountDetailsViewControllerSpy: AccountDetailsDisplayLogic {
    var displayAccountInfoCalled = false
    var displayStatementsCalled = false
    
    var displayedAccountInfo: AccountDetails.AccountInfo.ViewModel?
    var displayedStatements: AccountDetails.ListStatements.ViewModel?

    func displayAccountInfo(viewModel: AccountDetails.AccountInfo.ViewModel) {
        displayAccountInfoCalled = true
        displayedAccountInfo = viewModel
    }
    
    func displayStatements(viewModel: AccountDetails.ListStatements.ViewModel) {
        displayStatementsCalled = true
        displayedStatements = viewModel
    }
}

// MARK: - Tests

class AccountDetailsPresenterTests: XCTestCase {

    func testPresentAccountInfo() {
        // GIVEN
        let viewControllerSpy = AccountDetailsViewControllerSpy()
        
        let presenter = AccountDetailsPresenter()
        presenter.viewController = viewControllerSpy
        
        let response = AccountDetails.AccountInfo.Response(user: Seeds.user)
        
        let expectedAgency = "12.34567-8"
        let expectedAccountNumber = "\(Seeds.user.account) / \(expectedAgency)"
        
        let expectedBalance = Seeds.user.balance.toCurrency()

        // WHEN
        presenter.presentAccountInfo(response: response)

        // THEN
        XCTAssertTrue(viewControllerSpy.displayAccountInfoCalled)
        XCTAssertEqual(viewControllerSpy.displayedAccountInfo?.name, Seeds.user.name)
        XCTAssertEqual(viewControllerSpy.displayedAccountInfo?.accountNumber, expectedAccountNumber)
        XCTAssertEqual(viewControllerSpy.displayedAccountInfo?.balance, expectedBalance)
    }
    
    func testPresentStatements() {
        // GIVEN
        let viewControllerSpy = AccountDetailsViewControllerSpy()

        let presenter = AccountDetailsPresenter()
        presenter.viewController = viewControllerSpy

        let response = AccountDetails.ListStatements.Response(
            statements: Seeds.Statements.all,
            success: true
        )

        // WHEN
        presenter.presentStatements(response: response)

        // THEN
        XCTAssertTrue(viewControllerSpy.displayStatementsCalled)
    }
}
