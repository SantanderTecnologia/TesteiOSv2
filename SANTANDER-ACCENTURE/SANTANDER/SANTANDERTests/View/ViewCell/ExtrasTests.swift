//
//  ExtrasTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class ExtrasTests: XCTestCase {
    
    func test_validarCPf(){
        let cpf = "252.008.868-05"
        let success = String.validarCPf(cpf: cpf)
        XCTAssertTrue(success)
    }
    
    func test_validarEmail(){
        let email = "mairapreto@me.com"
        let succees = String.validarEmail(email: email)
        
        XCTAssertTrue(succees)
    }
    
    func test_validarPassword(){
        let password = "aS1@"
        let success = String.validarPassword(password)
        XCTAssertTrue(success)
    }
    
    func test_dateFromCustomString(){
        let str = String.dateFromCustomString(customString: "2020-04-20")
        XCTAssert(str == "20/04/2020")
    }
}
