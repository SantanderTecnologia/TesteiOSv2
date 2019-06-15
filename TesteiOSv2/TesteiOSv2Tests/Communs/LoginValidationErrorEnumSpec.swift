//
//  LoginValidationErrorEnumSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble


@testable import TesteiOSv2

class LoginValidationErrorEnumSpec : QuickSpec{
    override func spec() {
        describe("LoginValidationErrorEnumSpec Spec"){
            
            context("Compare values"){
                let loginErrorTitlePassword : String = "A senha deve conter um caracter alfanumérico, um maiúculo e um especial."
                let loginErrorUsername : String = "CPF ou email inválidos."
                let loginErrorUserTitle : String = "Usuário Incorreto"
                var usernameEnum : String!
                var passwordEnum : String!
                var usernameEnumTitle : String!
                var enum1: LoginValidationErrorEnum = .password
                var enum2: LoginValidationErrorEnum = .username
                beforeEach {
                    usernameEnumTitle = enum2.errorTitle
                    usernameEnum = enum2.errorMensage
                    passwordEnum = enum1.errorMensage
                }
                
                it("is correct password error menssage"){
                    expect(passwordEnum == loginErrorTitlePassword).to(beTrue())
                }
                
                it("is correct username error menssage"){
                    expect(loginErrorUsername == usernameEnum).to(beTrue())
                }
                it("is correct username error title"){
                    expect(loginErrorUserTitle == usernameEnumTitle).to(beTrue())
                }
            }
        }
    }
}
