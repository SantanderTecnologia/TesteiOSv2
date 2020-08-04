//
//  Double+ExtensionTest.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import XCTest
@testable import Teste_iOS_v2

class DoubleTest: XCTestCase {
    
    func testMoneyFormatter() {
        let numberOne: Double = 1000
        let numberTwo: Double = -500
        XCTAssertEqual(numberOne.getMoneyFormat(), "R$1.000,00")
        XCTAssertEqual(numberTwo.getMoneyFormat(), "- R$500,00")
    }
}
