//
//  AccountDetailsInteractorTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import XCTest
@testable import TCS_Challenge

class AccountDetailsInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: AccountDetailsInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupAccountDetailsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupAccountDetailsInteractor() {
        sut = AccountDetailsInteractor()
    }
    
    // MARK: - Test doubles
    
    class AccountDetailsPresentationLogicSpy: AccountDetailsPresentationLogic {

        // MARK: Method call expectations
        var presentFetchedStatementsCalled = false
        var presentFetchedAccountInfoCalled = false
        var presentErrorMessageCalled = false
        
        // MARK: Argument expectations
        var statementsResponse: AccountDetails.FetchStatements.Response!
        var accountInfoResponse: AccountDetails.FetchAccountInfo.Response!
        
        // MARK: Spied methods
        func presentFetchedStatements(response: AccountDetails.FetchStatements.Response) {
            presentFetchedStatementsCalled = true
            statementsResponse = response
        }
        
        func presentFetchedAccountInfo(response: AccountDetails.FetchAccountInfo.Response) {
            presentFetchedAccountInfoCalled = true
            accountInfoResponse = response
        }
        
        func presentErrorMessage(_ message: String) {
            presentErrorMessageCalled = true
        }
        
        func logoutUser() {
        }
    }
    
    class AccountDetailsWorkerSpy: AccountDetailsWorker {
        
        static let invalidUserId: Int = -1
        
        // MARK: Method call expectations
        var fetchStatementsCalled = false
        
        // MARK: Spied methods
        override func fetchStatements(request: AccountDetails.FetchStatements.Request, completion: @escaping (AccountDetailsWorker.StatementsResponse) -> Void) {
            fetchStatementsCalled = true

            if request.userId == String(AccountDetailsWorkerSpy.invalidUserId) {
                completion(.nonSpecifiedError)
            } else {
                completion(.success([Seeds.Statements.tedStatement]))
            }
        }
    }
    
    // MARK: - Tests
    
    func testFetchStatementsShouldAskAccountDetailsWorkerToFetchAndPresenterToFormatResults() {
        // Given
        let accountDetailsPresentationLogicSpy = AccountDetailsPresentationLogicSpy()
        sut.presenter = accountDetailsPresentationLogicSpy
        let accountDetailsWorkerSpy = AccountDetailsWorkerSpy()
        sut.worker = accountDetailsWorkerSpy
        
        // When
        sut.userAccount = Seeds.AccountsInfos.amy
        sut.fetchStatements()
        
        // Then
        XCTAssert(accountDetailsWorkerSpy.fetchStatementsCalled, "FetchStatements should ask AccountDetailsWorker to fetch statements")
        XCTAssert(accountDetailsPresentationLogicSpy.presentFetchedStatementsCalled, "FetchStatements should ask presenter to format the statements")
    }
    
    func testFetchStatementsWithInvalidAccountInfoShouldAskPresenterToPresentErrorMessage() {
        // Given
        let accountDetailsPresentationLogicSpy = AccountDetailsPresentationLogicSpy()
        sut.presenter = accountDetailsPresentationLogicSpy
        let accountDetailsWorkerSpy = AccountDetailsWorkerSpy()
        sut.worker = accountDetailsWorkerSpy
        
        // When
        sut.userAccount = AccountInfo(userId: AccountDetailsWorkerSpy.invalidUserId, name: "Amy Go", bankAccount: "1234", agency: "a25123", balance: 1500)
        sut.fetchStatements()
        
        // Then
        XCTAssert(accountDetailsPresentationLogicSpy.presentErrorMessageCalled, "FetchStatements with an invalid user id should ask the presenter to present an error message")
    }
    
    func testFetchAccountInfoShouldAskPresenterToFormatResult() {
        // Given
        let accountDetailsPresentationLogicSpy = AccountDetailsPresentationLogicSpy()
        sut.presenter = accountDetailsPresentationLogicSpy
        sut.userAccount = Seeds.AccountsInfos.amy
        
        // When
        sut.fetchAccountInfo()

        // Then
        XCTAssert(accountDetailsPresentationLogicSpy.presentFetchedAccountInfoCalled, "FetchAccount should ask presenter to format the statements")
    }
    
    func testFetchInvalidAccountInfoShouldAskPresenterToLogoutUser() {
        // Given
        let accountDetailsPresentationLogicSpy = AccountDetailsPresentationLogicSpy()
        sut.presenter = accountDetailsPresentationLogicSpy
        sut.userAccount = nil
        
        // When
        sut.fetchAccountInfo()
        
        // Then
        XCTAssertFalse(accountDetailsPresentationLogicSpy.presentFetchedAccountInfoCalled, "FetchAccountInfo with invalid user account should ask presenter to logout user")
    }
}
