//
//  UserWorkerTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class UserWorkerTests: XCTestCase {

    func testWorker() {
        // GIVEN
        let user = "foo@email.com"
        let worker = UserWorker()
        
        // WHEN
        worker.saveUser(user)

        // THEN
        let savedUser = worker.getUser()

        XCTAssertEqual(savedUser, user)
    }
}
