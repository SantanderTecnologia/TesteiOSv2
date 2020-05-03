//
//  UserAccountTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class UserAccountTests: XCTestCase {
    
    func testeInit_UserID(){
        let user = UserAccount(userID: 10, name: "", bankAccount: "", agency: "", balance: 0)
        XCTAssertEqual(user.userID, 10)
    }
    
    func testeInit_name(){
        let user = UserAccount(userID: 10, name: "Maira Acioli", bankAccount: "", agency: "", balance: 0)
        XCTAssertEqual(user.name, "Maira Acioli")
    }
    
    func testeInit_bankAccount(){
        let user = UserAccount(userID: 10, name: "", bankAccount: "1234", agency: "", balance: 0)
        XCTAssertEqual(user.bankAccount, "1234")
    }
    
    func testeInit_Agency(){
        let user = UserAccount(userID: 10, name: "", bankAccount: "", agency: "12345", balance: 0)
        XCTAssertEqual(user.agency, "12345")
    }
    
    func testeInit_Balance(){
        let user = UserAccount(userID: 10, name: "", bankAccount: "", agency: "", balance: 5525)
        XCTAssertEqual(user.balance, 5525)
    }
    
    
    
}
