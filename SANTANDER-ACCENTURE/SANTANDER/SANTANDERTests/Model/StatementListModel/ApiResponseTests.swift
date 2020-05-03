//
//  ApiResponseTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class ApiResponseTests: XCTestCase {
    
    func testeInit_userAccount(){
        
        let statements = StatementList(title: "TED", desc: "Aluguel", date: "2020-04-20", value: 5025)
        
        let apiResponse = ApiResponse(statementList: [statements], error: nil)
        
        XCTAssertEqual(apiResponse.statementList?[0].title, "TED")
        XCTAssertEqual(apiResponse.statementList?[0].desc, "Aluguel")
        XCTAssertEqual(apiResponse.statementList?[0].date, "2020-04-20")
        XCTAssertEqual(apiResponse.statementList?[0].value, 5025)
    }
}
