//
//  HomePresenterTests.swift
//  CleanSwiftTests
//
//  Created by Samanta Coutinho on 2019-08-21.
//  Copyright © 2019 Sam. All rights reserved.
//

import XCTest
@testable import CleanSwift

class HomePresenterTests: XCTestCase {
    var homePresenter: HomePresenter!

    override func setUp() {
        super.setUp()
        self.homePresenter = HomePresenter()
        
    }
    
    override func tearDown() {
        self.homePresenter = nil
        super.tearDown()
    }
    
    func testPresenter() {
        let response = Home.Response(statementsList: nil, user: nil, error: "no user")
        homePresenter.presentSomething(response: response)
        XCTAssertTrue(homePresenter.statements.count == 0)
    }
}
