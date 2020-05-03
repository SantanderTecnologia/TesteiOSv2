//
//  LoginTableViewCellTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class LoginTableViewCellTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_verifyValidFields(){
        let bundle = Bundle(for: LoginTableViewCell.self)
        guard let cell = bundle.loadNibNamed("LoginTableViewCell", owner: nil)?.first as? LoginTableViewCell else {
            return XCTFail()
        }
        cell.nomeUsuarioTextField.text = "mairapreto@me.com"
        cell.senhaUsuarioTextField.text = "aS1@"
        let valid = cell.verifyIfValidFields()
        
        XCTAssertEqual(valid, true)
    }
    
    func test_setupDefaultValuesOnDismiss(){
        let bundle = Bundle(for: LoginTableViewCell.self)
        guard let cell = bundle.loadNibNamed("LoginTableViewCell", owner: nil)?.first as? LoginTableViewCell else {
            return XCTFail()
        }
        cell.setupDefaultValuesOnDismiss()
        XCTAssertEqual(cell.nomeUsuarioTextField.placeholder, "User")
        XCTAssertEqual(cell.senhaUsuarioTextField.placeholder, "Password")
        XCTAssertEqual(cell.senhaUsuarioTextField.text, "")
    }

    func test_loginButton(){
        let bundle = Bundle(for: LoginTableViewCell.self)
        guard let cell = bundle.loadNibNamed("LoginTableViewCell", owner: nil)?.first as? LoginTableViewCell else {
            return XCTFail()
        }
        cell.nomeUsuarioTextField.text = "MairaAcioli"
        cell.senhaUsuarioTextField.text = "aS2@"
        
        cell.loginButton(AnyObject.self)
        XCTAssertEqual(cell.nomeUsuarioTextField.layer.borderColor, UIColor.red.cgColor)
        XCTAssertEqual(cell.senhaUsuarioTextField.layer.borderColor, UIColor.red.cgColor)
    }
    
}



