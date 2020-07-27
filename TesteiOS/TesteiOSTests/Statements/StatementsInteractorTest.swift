//
//  AccountDetailsInteractorTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class AccountDetailsInteractorTest: XCTestCase {
    
      var sut: AccountDetailsInteractor!
        
      override func setUp() {
          super.setUp()
          setupStatementsInteractor()
      }
          
      func setupStatementsInteractor() {
          sut = AccountDetailsInteractor()
      }
        
      class StatementsPresentationLogicSpy: AccountDetailsPresentationLogig {
          var fetchStatementIsCalled = false
          var fetchErrorIsCalled = false
          var setupHeaderIsCalled = false
          
          func presenterFetchAccountDetails(response: AccountDetailsModel.Fetch.Response) {
              fetchStatementIsCalled = true
          }
          
          func presentFetchError(error: String) {
              fetchErrorIsCalled = true
          }
          
          func setupHeader(data: AccountDetailsModel.Header.Response) {
              setupHeaderIsCalled = true
          }
      }
      
      class StatementWorkerSpy: AccountDetailsWorker {
          let presentationLogic = StatementsPresentationLogicSpy()
          
          override func fetchStatements(completionSuccess: @escaping FetchStatementResponseSuccess, completionFailure: @escaping FetchStatementResponseFailure) {
              let response = AccountDetailsModel.Fetch.Response(statements: nil)
              presentationLogic.presenterFetchAccountDetails(response: response)
          }
      }
          
      func testFetchStatements() {
          let worker = StatementWorkerSpy()
          sut.worker = worker
          
          sut.fetchStatements()
          XCTAssertTrue(worker.presentationLogic.fetchStatementIsCalled)
      }
      
      func testeSetupHeader() {
          let statementPresentationSpy = StatementsPresentationLogicSpy()
          sut.presenter = statementPresentationSpy
          let request = AccountDetailsModel.Header.Request(headerData: nil)
          
          sut.fetchHeader(data: request)
          XCTAssertTrue(statementPresentationSpy.setupHeaderIsCalled)
      }

    
}
