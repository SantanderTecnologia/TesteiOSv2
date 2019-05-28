//
//  LoginPresenterTests.swift
//  TesteIOSTests
//
//  Created by Khalid Ait Bellahs on 27/05/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteIOS

class LoginPresenterTests: XCTestCase {
    
    var presenter: LoginPresenter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        setupLoginPresenter()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupLoginPresenter() {
        presenter = LoginPresenter()
    }
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        
        var displayLoginErrorMessageCalled = false
        var displaySuccessfullLoginCalled = false
        
        func displayStatmentView() {
            displaySuccessfullLoginCalled = true
        }
        
        func showAlertMsg(title: String, message: String) {
            displayLoginErrorMessageCalled = true
        }
        
        func showLoading() {
            
        }
        
        func hideLoading() {
            
        }
    }
    
    // MARK: Tests
    
    func testSuccessLogin() {
        // Given
        let spy = LoginDisplayLogicSpy()
        presenter.viewController = spy
        let jsonDictionary: [String: Any] = ["userId": 1, "name": "khalid", "bankAccount": "202109","agency": "1001","balance":2041.89]
        let userAccount = Mapper<UserAccount>().map(JSON: jsonDictionary)
        
        let response = Login.doLogin.Response(userAccount: userAccount!, error: nil)
        
        // When
        presenter.presentLogin(response: response)
        
        // Then
        XCTAssertTrue(spy.displaySuccessfullLoginCalled)
    }


}
