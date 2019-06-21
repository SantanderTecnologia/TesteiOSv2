//
//  KeychainHelperTests.swift
//  TesteSantanderTests
//
//  Created by Hugo Abolis Jordao on 19/06/19.
//  Copyright © 2019 Hugo Abolis Jordao. All rights reserved.
//

import XCTest
@testable import TesteSantander

class KeychainHelperTests: XCTestCase {

    func testKeychainHelperSavePassword(){
        //Given
        let pass = "12345"
        
        //When
        var status = KeychainService.savePassword(service: Constants.keyChainServiceName, account: Constants.savedPass, data: pass)
        
        if status == errSecDuplicateItem{
            status = KeychainService.updatePassword(service: Constants.keyChainServiceName, account: Constants.savedPass, data: pass)
        }
        //Then
        XCTAssert(status == errSecSuccess, "Erro com OSSSatus: \(status)")
    }
    
    func testKeychainHelperUpdatePassword(){
        //Given
        let pass = "12345"
        
        //When
        let status = KeychainService.updatePassword(service: Constants.keyChainServiceName, account: Constants.savedPass, data: pass)
        
        //Then
        XCTAssert(status == errSecSuccess, "Erro com OSSSatus: \(status)")
    }
    
    func testKeychainHelperLoadPassword(){
        //Given
        let pass = "12345"
        
        _ = KeychainService.savePassword(service: Constants.keyChainServiceName, account: Constants.savedPass, data: pass)
        //When
        let savedPassItem = KeychainService.loadPassword(service: Constants.keyChainServiceName, account: Constants.savedPass)
        
        //Then
        XCTAssert(savedPassItem.1 == errSecSuccess, "Erro com OSSSatus: \(savedPassItem.1)")
    }

}
