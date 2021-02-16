//
//  DateConversionTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class DateConversionTests: XCTestCase {
    
    let presenter = StatementsPresenter()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_formatCurrency_validDate() {
        let day = "02"
        let month = "01"
        let year = "1999"
        let date = "\(year)-\(month)-\(day)"
        
        let dateBrFormat = presenter.convertDate(date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy")
        XCTAssertEqual(dateBrFormat, "\(day)/\(month)/\(year)")
    }
    
    func test_formatCurrency_invalidDate() {
        let day = "30"
        let month = "02"
        let year = "1999"
        let date = "\(year)-\(month)-\(day)"
        
        let dateBrFormat = presenter.convertDate(date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy")
        XCTAssertEqual(dateBrFormat, nil)
    }
    

}
