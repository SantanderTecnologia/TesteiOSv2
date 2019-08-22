//
//  HomeInteractorTests.swift
//  CleanSwiftTests
//
//  Created by Samanta Coutinho on 2019-08-20.
//  Copyright © 2019 Sam. All rights reserved.
//

import XCTest
import Alamofire
@testable import CleanSwift

class HomeInteractorTests: XCTestCase {
    var user: UserRealm!
    var homeInteractor: HomeInteractor!
    fileprivate var worker: MockHomeWorker!
    
    override func setUp() {
        super.setUp()
        self.worker = MockHomeWorker()
        self.user = UserRealm()
        self.homeInteractor = HomeInteractor(worker: worker, user: user)
    }
    
    override func tearDown() {
        self.homeInteractor = nil
        self.worker = nil
        self.user = nil
        super.tearDown()
    }
    
    func testFetchWithNoWorker() {
        let expectation = XCTestExpectation(description: "no worker")
        homeInteractor.worker = nil
        let response = Home.Response(statementsList: nil, user: self.user,
                                     error: expectation.description)
        homeInteractor.presenter?.presentSomething(response: response)
        if homeInteractor.worker == nil {
            expectation.fulfill()
        }
        let request = Home.Request(userId: "01")
        homeInteractor.doSomething(request: request)
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchNoUserInfo() {
        let expectation = XCTestExpectation(description: "no user info")
        worker.statementList = nil
        let response = Home.Response(statementsList: nil, user: nil, error: "no user info")
        homeInteractor.presenter?.presentSomething(response: response)
        if worker.statementList == nil {
            expectation.fulfill()
        }
        let request = Home.Request(userId: "")
        homeInteractor.doSomething(request: request)
        wait(for: [expectation], timeout: 5.0)
    }

}

fileprivate class MockHomeWorker: HomeWorkerProtocol {
    var statementList: StatementList?
    func doSomeWork(request: Home.Request, completion: @escaping (Result<StatementList>) -> Void) {
        if let statements = statementList {
            completion(Result.success(statements))
        }
    }
}
