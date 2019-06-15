//
//  EmailValidatorSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class EmailValidatorSpec : QuickSpec{
    override func spec() {
        describe("EmailValidatorSpec Spec") {
            var email : String!
            context("Initilize one email "){
                var isValid : Bool!
                var isInvalid : Bool!
                beforeEach {
                    email = "feldi@gmail.com"
                    isValid = email.isValidEmail()
                    email = "sjnsunsujsujsu"
                    isInvalid = email.isValidEmail()
                }
                
                it("with a valid email"){
                    expect(isValid).to(beTrue())
                }
                
                it("with a invalid email"){
                    expect(isInvalid).to(beFalse())
                }
            }
        }
    }
}
