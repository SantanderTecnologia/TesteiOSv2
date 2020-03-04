//
//  EmailValidateTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
@testable import BankTest

class EmailValidateTests: XCTestCase {

    func testCheckAnEmailIsValid() {
        assert("luan.vna@me.com".isValidEmail(), "E-mail validado com sucesso")
    }

    func testCheckEmailWithoutDomain() {
        assert(!"luan.vna@".isValidEmail(), "E-mail sem dominio validado com o incorreteo")
    }

    func testCheckEmailWithShortDomain() {
        assert("luan.vna@dd.dd".isValidEmail(), "E-mail sem dominio validado com o incorreteo")
    }

    func testEmailStartWithNumber() {
        assert("1luan.vna@me.com".isValidEmail(), "E-mail iniciado com número validado com sucesso")
    }

    func testEmailWithOneSpace() {
        assert(!"1lu an.vna@me.com".isValidEmail(), "E-mail com espaço validado com sucesso")
    }
}
