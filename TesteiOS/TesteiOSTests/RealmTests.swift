//
//  RealmTests.swift
//  TesteiOSTests
//
//  Created by Fernando Gomes on 19/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import TesteiOS

class RealmTests: XCTestCase {
    var user: UserAccount!
    var repository: UserRepository!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.user = Mapper<UserAccount>().map(JSON: ["userId": 1, "name": "luis", "bankAccount": "123434","agency": "999","balance":1000.00])
        self.repository = UserRepository.shared
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCrud() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        saveUser()
        getUser()
        deleteAll()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func saveUser() {
        XCTAssertNotNil(self.user)
        repository.saveUser(user: self.user)
    }
    
    func getUser() {
        XCTAssertNotNil(self.user)
        repository.getUser(callback: {
            user in
            XCTAssertNotNil(user)
        })
    }
    
    func deleteAll() {
        self.repository.deleteAll()
    }

}
