//
//  LoginRouterTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 30/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class LoginRouterTest: XCTestCase {
    
    var sut: LoginRouter!
    
    override func setUp()
    {
      super.setUp()
        sut = LoginRouter()
        sut.dataStore = LoginInteractor()
    }

    //MARK: - Tests
    func testRouteToStatementsList(){
        let segue = UIStoryboardSegue(identifier: "statementsSegue", source: LoginViewController(), destination: StatementsViewController())
        sut.routeToStatementsList(segue: segue)
        XCTAssertNotNil(sut.dataStore)
    }
    
}
