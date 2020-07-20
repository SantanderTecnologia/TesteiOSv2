//
//  AccountDetailsPresenterTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import XCTest
@testable import TCS_Challenge

class AccountDetailsPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: AccountDetailsPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupAccountDetailsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupAccountDetailsPresenter() {
        sut = AccountDetailsPresenter()
    }
    
    // MARK: - Test doubles
    
    class AccountDetailsDisplayLogicSpy: AccountDetailsDisplayLogic {
        
        // MARK: Method call expectations
        var displayFetchedStatementsCalled = false
        var displayFetchedAccountInfoCalled = false
        var displayErrorMessageCalled = false
        var logoutUserCalled = false
        
        // MARK: Argument expectations
        var fetchStatementsViewModel: AccountDetails.FetchStatements.ViewModel!
        var fetchAccountInfoViewModel: AccountDetails.FetchAccountInfo.ViewModel!
        
        // MARK: Spied methods
        func displayFetchedStatements(viewModel: AccountDetails.FetchStatements.ViewModel) {
            displayFetchedStatementsCalled = true
            fetchStatementsViewModel = viewModel
        }
        
        func displayFetchedAccountInfo(viewModel: AccountDetails.FetchAccountInfo.ViewModel) {
            displayFetchedAccountInfoCalled = true
            fetchAccountInfoViewModel = viewModel
        }
        
        func displayErrorMessage(_ message: String) {
            displayErrorMessageCalled = true
        }
        
        func logoutUser() {
            logoutUserCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedStatements() {
        // Given
        let accountDetailsDisplayLogicSpy = AccountDetailsDisplayLogicSpy()
        sut.viewController = accountDetailsDisplayLogicSpy
        
        // When
        let ted = Seeds.Statements.tedStatement
        let statements = [ted]
        let response = AccountDetails.FetchStatements.Response(statementList: statements)
        sut.presentFetchedStatements(response: response)
        
        // Then
        let displayedStatements = accountDetailsDisplayLogicSpy.fetchStatementsViewModel.displayedStatements
        for displayedStatement in displayedStatements {
            XCTAssertEqual(displayedStatement.title, "TED Recebida", "Presenting fetched statements should properly format title")
            XCTAssertEqual(displayedStatement.desc, "Rafael Cruz", "Presenting fetched statements should properly format description")
            XCTAssertEqual(displayedStatement.value, "R$1.550,00", "Presenting fetched statements should properly format value")
            XCTAssertEqual(displayedStatement.date, "02/10/2019", "Presenting fetched statements should properly format date")
        }
        
        XCTAssert(accountDetailsDisplayLogicSpy.displayFetchedStatementsCalled, "Presenting fetched statements should ask view controller to display them")
    }
    
    func testPresentFetchedAccountInfo() {
        // Given
        let accountDetailsDisplayLogicSpy = AccountDetailsDisplayLogicSpy()
        sut.viewController = accountDetailsDisplayLogicSpy
        
        // When
        let amy = Seeds.AccountsInfos.amy
        let response = AccountDetails.FetchAccountInfo.Response(accountInfo: amy)
        sut.presentFetchedAccountInfo(response: response)
        
        // Then
        let displayedAccountInfo = accountDetailsDisplayLogicSpy.fetchAccountInfoViewModel.displayedAccountInfo
        
        XCTAssertEqual(displayedAccountInfo.name, "Amy Lala Vas", "Presenting fetched statements should properly format name")
        XCTAssertEqual(displayedAccountInfo.balance, "R$45.120,90", "Presenting fetched statements should properly format balance")
        XCTAssertEqual(displayedAccountInfo.account, "312351 / 2321", "Presenting fetched statements should properly format account")
        XCTAssert(accountDetailsDisplayLogicSpy.displayFetchedAccountInfoCalled, "Presenting fetched account info should ask view controller to display it")
    }
    
    func testPresentErrorMessage() {
        // Given
        let accountDetailsDisplayLogicSpy = AccountDetailsDisplayLogicSpy()
        sut.viewController = accountDetailsDisplayLogicSpy
        
        // When
        sut.presentErrorMessage("Error Message")
        
        // Then
        XCTAssert(accountDetailsDisplayLogicSpy.displayErrorMessageCalled, "Present error message should ask view controller to route to display it")
    }
    
    func testLogoutUser() {
        // Given
        let accountDetailsDisplayLogicSpy = AccountDetailsDisplayLogicSpy()
        sut.viewController = accountDetailsDisplayLogicSpy
        
        // When
        sut.logoutUser()
        
        // Then
        XCTAssert(accountDetailsDisplayLogicSpy.logoutUserCalled, "Logout user should ask view controller to route to Login View")
    }
}
