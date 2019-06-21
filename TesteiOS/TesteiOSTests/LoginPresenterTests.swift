//
//  LoginPresenter.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 16/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class LoginPresenterTests: XCTestCase {
    
    var loginPresenter: LoginPresenter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginPresenter = LoginPresenter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    class LoginLogicTest: LoginDisplayLogic {
        var displayLoginErrorMessageCalled = false
        var displaySuccessfullLoginCalled = false
        
        func displayStatmentView() {
            displaySuccessfullLoginCalled = true
        }
        
        func displayErrorMessage(title: String, message: String) {
            displayLoginErrorMessageCalled = true
        }
        
        func showLoading() {
            
        }
        
        func hideLoading() {
            
        }
        
        
    }
    
    func testLoginLogic() {
        let logicDisplay = LoginLogicTest()
        loginPresenter.viewController = logicDisplay
        let userJson: [String: Any] = ["userId": 1, "name": "luis", "bankAccount": "123434","agency": "999","balance":1000.00]
        
        let userAccount = Mapper<UserAccount>().map(JSON: userJson)
        let response = Login.doLogin.Response(userAccount: userAccount!, error: nil)
        loginPresenter.presentLogin(response: response)
        
        XCTAssertTrue(logicDisplay.displaySuccessfullLoginCalled)
    }

}
