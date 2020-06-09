//
//  StatementsInteractorTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 06/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class StatementsInteractorTest: XCTestCase {
    // MARK: - Subject under test
    var sut: StatementsInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
      super.setUp()
      sut = StatementsInteractor()
    }
    
    class StatementsPresentationLogicSpy: StatementsPresentationLogic
    {
      // MARK: Method call expectations
      var presentUserAccountCalled = false
      var presentFetchedCalled = false
      
      // MARK: Spied methods
      func presentUserAccount(response: Statements.LoadUserAccount.Response) {
          presentUserAccountCalled = true
      }
      
      func presentFetchedStatements(response: Statements.LoadStatements.Response) {
          presentFetchedCalled = true
      }
    }
    
    class StatementsWorkerSpy: StatementsWorker
    {
      // MARK: Method call expectations
      var fetchStatementsCalled = false
      
      // MARK: Spied methods
        override func fetchStatements(userId: Int, completionHandler: @escaping ([Statement]?, String?) -> Void) {
            fetchStatementsCalled = true
            completionHandler([Statement(title: "Pagamento", desc: "conta de luz", date: "10/05/2020", value: -50.99)], nil)
        }
    }
    
    func testPresentUserAccount(){
        // Given
        let presentationLogicSpy = StatementsPresentationLogicSpy()
        sut.presenter = presentationLogicSpy
        
        // When
        sut.loadUserAccount(request: Statements.LoadUserAccount.Request())
        
        // Then
        XCTAssert(presentationLogicSpy.presentUserAccountCalled)
    }
    
    func testPresentFetchedStatementsWithoutUserID(){
        // Given
        let presentationLogicSpy = StatementsPresentationLogicSpy()
        sut.presenter = presentationLogicSpy
        
        // When
        sut.loadStatements(request: Statements.LoadStatements.Request())
        
        // Then
        XCTAssert(presentationLogicSpy.presentFetchedCalled)
    }
    
    func testPresentFetchedStatements(){
        // Given
        let presentationLogicSpy = StatementsPresentationLogicSpy()
        let userAccount = UserAccount(userId: 0, name: "Carlos Williamberg", bankAccount: "001", agency: "0001", balance: 1100.0)
        let workerSpy = StatementsWorkerSpy()
        sut.presenter = presentationLogicSpy
        sut.userAccount = userAccount
        sut.worker = workerSpy
        
        // When
        sut.loadStatements(request: Statements.LoadStatements.Request())
        
        // Then
        XCTAssert(workerSpy.fetchStatementsCalled)
        XCTAssert(presentationLogicSpy.presentFetchedCalled)
    }
}
