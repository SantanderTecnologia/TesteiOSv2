//
//  KeychainTests.swift
//  KeychainTests
//
//  Created by Estaife Lima on 08/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import Keychain

class KeychainTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        clearLastKey()
    }
    
    func testSaveKeyValid() throws {
        
        //Given
        let keychain = Keychain()
        let key = "test@provider.com"
        let password = "P@ss1word"
        
        //When
        let wasSaved = keychain.save(password: password, key: key)
        
        //Then
        XCTAssertTrue(wasSaved)
        XCTAssertNotNil(keychain.lastKey)
    }
    
    func testDeleteKeyValid() throws {
        
        //Given
        let keychain = Keychain()
        let key = "test@provider.com"
        let password = "P@ss1word"
        
        //When
        keychain.save(password: password, key: key)
        let wasDeleted = keychain.delete(key: key)
        
        //Then
        XCTAssertTrue(wasDeleted)
        XCTAssertNil(keychain.lastKey())
    }
    
    func testDeleteKeyInvalid() throws {
        
        //Given
        let keychain = Keychain()
        let key = "invalid_key@invalid.com"
        
        //When
        let wasDeleted = keychain.delete(key: key)
        
        //Then
        XCTAssertFalse(wasDeleted)
    }
    
    func testRetrivePassword() throws {
        
        //Given
        let keychain = Keychain()
        let key = "test_retrive@provider.com"
        let password = "P@ss1word123"
        
        //When
        keychain.save(password: password, key: key)
        let passwordReceived = keychain.retrieve(key: key)
        
        //Then
        XCTAssertEqual(password, passwordReceived)
    }
    
    func testRetrivePasswordWhenDontExist() throws {
        
        //Given
        let keychain = Keychain()
        let key = "dont_exist_passl@word.com"
        
        //When
        let passwordReceived = keychain.retrieve(key: key)
        
        //Then
        XCTAssertNil(passwordReceived)
    }
}

extension KeychainTests {
    func clearLastKey() {
        let keychain = Keychain()
        guard let key = keychain.lastKey() else { return }
        keychain.delete(key: key)
    }
}
