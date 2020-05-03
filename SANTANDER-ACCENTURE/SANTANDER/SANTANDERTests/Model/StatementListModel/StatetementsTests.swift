//
//  StatetementsTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class StatetementsTests: XCTestCase {
    
    func testeInit_Statement(){
        
        let statement = StatementList(title: "TED", desc: "Aluguel", date: "2020-04-20", value: 5025)
        
        XCTAssertEqual(statement.title, "TED")
        XCTAssertEqual(statement.desc, "Aluguel")
        XCTAssertEqual(statement.date, "2020-04-20")
        XCTAssertEqual(statement.value, 5025)
    }
    
    func testProtocol() {
        let statmentTest = StatementsControllerProtocolTest()
        statmentTest.loadList { (success) in
            XCTAssertEqual(success, true)
            
        }
        
    }
}
