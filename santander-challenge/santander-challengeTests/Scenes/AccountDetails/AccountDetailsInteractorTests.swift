//
//  AccountDetailsInteractorTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

// MARK: - Test Doubles

class AccountDetailsPresenterSpy: AccountDetailsPresentationLogic {
    var presentAccountInfoCalled = false
    var presentStatementsCalled = false
    
    var presentedUser: User?
    
    var presentedStatementsSuccess = false
    var presentedStatements: [Statement] = []

    func presentAccountInfo(response: AccountDetails.AccountInfo.Response) {
        presentAccountInfoCalled = true
        presentedUser = response.user
    }

    func presentStatements(response: AccountDetails.ListStatements.Response) {
        presentStatementsCalled = true
        presentedStatementsSuccess = response.success
        presentedStatements = response.statements
    }
}

class AccountDetailsWorkerSuccessSpy: AccountDetailsWorkerLogic {
    var listStatementsCalled = false
    var listStatementsCalledWithUserId: Int = 0
    
    func listStatements(userId: Int, _ completion: @escaping (([Statement]?, Bool?) -> Void)) {
        listStatementsCalled = true
        listStatementsCalledWithUserId = userId

        completion(Seeds.Statements.all, nil)
    }
}

class AccountDetailsWorkerFailedSpy: AccountDetailsWorkerLogic {
    var listStatementsCalled = false
    var listStatementsCalledWithUserId: Int = 0
    
    func listStatements(userId: Int, _ completion: @escaping (([Statement]?, Bool?) -> Void)) {
        listStatementsCalled = true
        listStatementsCalledWithUserId = userId

        completion(nil, true)
    }
}

// MARK: - Tests

class AccountDetailsInteractorTests: XCTestCase {

    func testShowAccountInfo() {
        // GIVEN
        let presenterSpy = AccountDetailsPresenterSpy()

        let interactor = AccountDetailsInteractor()
        interactor.presenter = presenterSpy
        interactor.user = Seeds.user

        let request = AccountDetails.AccountInfo.Request()

        // WHEN
        interactor.showAccountInfo(request: request)

        // THEN
        XCTAssertTrue(presenterSpy.presentAccountInfoCalled)
        XCTAssertEqual(presenterSpy.presentedUser, Seeds.user)
    }

    func testShowAccountInfoWithoutUser() {
        // GIVEN
        let presenterSpy = AccountDetailsPresenterSpy()

        let interactor = AccountDetailsInteractor()
        interactor.presenter = presenterSpy

        let request = AccountDetails.AccountInfo.Request()

        // WHEN
        interactor.showAccountInfo(request: request)

        // THEN
        XCTAssertFalse(presenterSpy.presentAccountInfoCalled)
    }

    func testListStatements() {
        // GIVEN
        let presenterSpy = AccountDetailsPresenterSpy()
        let workerSpy = AccountDetailsWorkerSuccessSpy()

        let interactor = AccountDetailsInteractor()
        interactor.presenter = presenterSpy
        interactor.worker = workerSpy
        interactor.user = Seeds.user

        let request = AccountDetails.ListStatements.Request()

        // WHEN
        interactor.listStatements(request: request)

        // THEN
        XCTAssertTrue(workerSpy.listStatementsCalled)
        XCTAssertEqual(workerSpy.listStatementsCalledWithUserId, Seeds.user.id)
        XCTAssertTrue(presenterSpy.presentStatementsCalled)
        XCTAssertTrue(presenterSpy.presentedStatementsSuccess)
        XCTAssertEqual(presenterSpy.presentedStatements, Seeds.Statements.all)
    }

    func testListStatementsWithoutUser() {
        // GIVEN
        let presenterSpy = AccountDetailsPresenterSpy()
        let workerSpy = AccountDetailsWorkerSuccessSpy()

        let interactor = AccountDetailsInteractor()
        interactor.presenter = presenterSpy
        interactor.worker = workerSpy

        let request = AccountDetails.ListStatements.Request()

        // WHEN
        interactor.listStatements(request: request)

        // THEN
        XCTAssertFalse(workerSpy.listStatementsCalled)
        XCTAssertFalse(presenterSpy.presentStatementsCalled)
    }

    func testListStatementsWithWorkerFailing() {
        // GIVEN
        let presenterSpy = AccountDetailsPresenterSpy()
        let workerSpy = AccountDetailsWorkerFailedSpy()

        let interactor = AccountDetailsInteractor()
        interactor.presenter = presenterSpy
        interactor.worker = workerSpy
        interactor.user = Seeds.user

        let request = AccountDetails.ListStatements.Request()

        // WHEN
        interactor.listStatements(request: request)

        // THEN
        XCTAssertTrue(workerSpy.listStatementsCalled)
        XCTAssertEqual(workerSpy.listStatementsCalledWithUserId, Seeds.user.id)
        XCTAssertTrue(presenterSpy.presentStatementsCalled)
        XCTAssertFalse(presenterSpy.presentedStatementsSuccess)
        XCTAssertEqual(presenterSpy.presentedStatements, [])
    }
}
