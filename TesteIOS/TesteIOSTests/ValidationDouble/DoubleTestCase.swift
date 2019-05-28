//
//  DoubleTestCase.swift
//  TesteIOSTests
//
//  Created by Khalid Ait Bellahs on 27/05/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
@testable import TesteIOS

class DoubleTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Double_To_Currency(){
        let double : Double = 523.2013
        let valor = "R$ 523,20"
        let toCurrency = double.toCurrency()
        XCTAssertEqual(toCurrency, valor)
    }

}
