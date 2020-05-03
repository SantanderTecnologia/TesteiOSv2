//
//  StringTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    func testApplyPattern() {
        // GIVEN
        let string = "123456"
        let pattern = "#.####-#"
        let replacementCharacter: Character = "#"
        
        let expected = "1.2345-6"

        // WHEN
        let stringWithPatternApplied = string.applyPattern(
            pattern: pattern,
            replacementCharacter: replacementCharacter
        )

        // THEN
        XCTAssertEqual(stringWithPatternApplied, expected)
    }
    
    func testStringToDate() {
        // GIVEN
        let string = "2020-05-01"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let expected = dateFormatter.date(from: "2020-05-01")

        // WHEN
        let date = string.toDate()

        // THEN
        XCTAssertEqual(date, expected)
    }
    
    func testStringIsEmail() {
        // GIVEN
        let string = "email+1@email.com"
        
        // WHEN
        let isEmail = string.isEmail

        // THEN
        XCTAssertTrue(isEmail)
    }

    func testStringIsNotEmail() {
        // GIVEN
        let string = "foo@a"
        
        // WHEN
        let isEmail = string.isEmail

        // THEN
        XCTAssertFalse(isEmail)
    }
    
    func testStringIsCpf() {
        // GIVEN
        let string = "19811565007"

        // WHEN
        let isCpf = string.isCPF

        // THEN
        XCTAssertTrue(isCpf)
    }
    
    func testStringIsNotCpfBecauseItHaveLessThanMinimumCharacters() {
        // GIVEN
        let string = "1981156500"

        // WHEN
        let isCpf = string.isCPF

        // THEN
        XCTAssertFalse(isCpf)
    }
    
    func testStringIsNotCpfBecauseCalculusAreWrong() {
        // GIVEN
        let string = "19811565006"

        // WHEN
        let isCpf = string.isCPF

        // THEN
        XCTAssertFalse(isCpf)
    }
}
