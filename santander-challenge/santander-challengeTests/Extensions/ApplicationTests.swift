//
//  ApplicationTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class ApplicationTests: XCTestCase {

    func testChangeStatusBarColor() {
        // GIVEN
        let color: UIColor = .darkBlue
        
        // WHEN
        UIApplication.statusBarColor = color

        // THEN
        XCTAssertEqual(UIApplication.statusBarColor, color)
    }
}
