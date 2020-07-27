//
//  UtilsText.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class UtilsText: XCTestCase {
    
    func testIsValidRegex() {
        let email = "teste@teste.com"
        let isValid = email.isValidRegex(regex: Constants.emailRegex)
        XCTAssertTrue(isValid)
    }
    
    func testInvalidRegec() {
        let email = "teste.com"
        let isInvalid = email.isValidRegex(regex: Constants.emailRegex)
        XCTAssertFalse(isInvalid)
    }
    
    func testValidCpf() {
        let cpf = "12402629061"
        let isValid = cpf.isValidCpf()
        XCTAssertTrue(isValid)
    }
    
    func testInvalidCpf() {
        let cpf = "111111111"
        let isInvalid = cpf.isValidCpf()
        XCTAssertFalse(isInvalid)
    }
    
    func testConvertDate() {
        let date = "1987-10-11"
        let dateConverter = date.convertDataFormat()
        XCTAssertEqual(dateConverter, "11/10/1987")
    }
    
    func testDateConverterFail() {
        let date = ""
        let dateConverter = date.convertDataFormat()
        XCTAssertNil(dateConverter)
    }
    
    func testDate() {
        let stringDate = "1987-10-11"
        let date = stringDate.toDate()
        
        XCTAssertNotEqual(date, Date())
    }
    
    func createDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "1987-11-12") ?? Date()
    }
    
    func testToString() {
        guard let date = createDate() else { return }
        let stringDate = date.toString()
        
        XCTAssertEqual(stringDate, "12/11/1987")
    }

    func testDoubleLocaleFormat() {
        let value = 20.0
        let stringValue = value.currencyFormatted()
        XCTAssertEqual(stringValue, "R$ 20,00")
    }

}
