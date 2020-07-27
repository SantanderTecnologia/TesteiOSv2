//
//  AccountDetailsPresenterTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class AccountDetailsPresenterTest: XCTestCase {
    
    var sut: AccountDetailsPresenter!
        
    override func setUp() {
        super.setUp()
        setupAccountDetailsPresenter()
    }
        
    func setupAccountDetailsPresenter() {
        sut = AccountDetailsPresenter()
    }
        
    class StatementsDisplayLogicSpy: AccountDetailsDisplayLogig {
        var displayDataIsCalled = false
        var displayHeaderIsCalled = false
        
        func displayData(viewModel: AccountDetailsModel.Fetch.ViewModel) {
            displayDataIsCalled = true
        }
        
        func displayHeaderData(viewModel: AccountDetailsModel.Header.ViewModel) {
            displayHeaderIsCalled = true
        }
    }
        
    func testFetchStatement() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let statement = Statement(title: "",
                                  desc: "",
                                  date: "",
                                  value: 0)
        let statementList = StatementList(statementList: [statement], error: nil)
        let response = AccountDetailsModel.Fetch.Response(statements: statementList)
        
        sut.presenterFetchAccountDetails(response: response)
        
        XCTAssertTrue(viewControllerSpy.displayDataIsCalled)
    }
    
    func testFetchHeader() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let response = AccountDetailsModel.Header.Response(headerData: nil)
        
        sut.setupHeader(data: response)
        XCTAssertTrue(viewControllerSpy.displayHeaderIsCalled)
    }
}
