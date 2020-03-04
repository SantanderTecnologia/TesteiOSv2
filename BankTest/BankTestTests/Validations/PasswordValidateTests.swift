//
//  PasswordValidateTEsts.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
@testable import BankTest

class PasswordValidateTests: XCTestCase {

    func testPasswordCorrect() {
        let isValid = "M@12".isValidPassword()
        assert(isValid, "Senha nos padrões")
    }

    func testPasswordIncorrect() {
        let isValid = "nome".isValidPassword()
        assert(!isValid, "Senha não tem caracter especial, numeros ou letra maiuscula")
    }

    func testPasswordCorrectWithNumber() {
        let isValid = "1dsadsa".isValidPassword()
        assert(!isValid, "Senha com numero e sem caracter especial e letra maiuscula")
    }

    func testPasswordCorrectWithSpecialCharacter() {
        let isValid = "@dsadsa".isValidPassword()
        assert(!isValid, "Senha com caracter especial e sem caracter numero e letra maiuscula")
    }
}
