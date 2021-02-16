//
//  CurrencyFormatterTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class CurrencyFormatterTests: XCTestCase {
    
    let presenter = StatementsPresenter()

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func test_formatCurrency_valueZero() {
        let zero: Float = 0.0
        
        XCTAssertEqual(zero, 0.0)
        XCTAssertEqual(presenter.formatAsCurrency(zero), "R$ 0,00")
    }
    
    func test_formatCurrency_valueNegative() {
        let negativeNumber: [Float] = [-4, -12.3, -1234.56, -12345.6789, -9876.4321]
        let stringArray: [String] = ["- R$ 4,00", "- R$ 12,30", "- R$ 1.234,56", "- R$ 12.345,68", "- R$ 9.876,43"]
        
        XCTAssertEqual(negativeNumber.count, stringArray.count)
        
        for (num, str) in zip(negativeNumber, stringArray) {
            XCTAssertLessThan(num, 0.0)
            XCTAssertEqual(presenter.formatAsCurrency(num), str)
        }
    }
    
    func test_formatCurrency_valuePositive() {
        let negativeNumber: [Float] = [4, 12.3, 1234.56, 12345.6789, 9876.4321]
        let stringArray: [String] = ["R$ 4,00", "R$ 12,30", "R$ 1.234,56", "R$ 12.345,68", "R$ 9.876,43"]
        
        XCTAssertEqual(negativeNumber.count, stringArray.count)
        
        for (num, str) in zip(negativeNumber, stringArray) {
            XCTAssertGreaterThan(num, 0.0)
            XCTAssertEqual(presenter.formatAsCurrency(num), str)
        }
    }
    

}
