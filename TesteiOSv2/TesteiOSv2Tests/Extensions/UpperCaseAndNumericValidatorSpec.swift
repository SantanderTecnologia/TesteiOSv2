//
//  UpperCaseValidatorSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class UpperCaseAndNumericValidatorSpec : QuickSpec{
    override func spec() {
        describe("UpperCaseAndNumericValidatorSpec Spec") {
            var string : String!
            context("Initilize one string"){
                var isValidUpperCase : Bool!
                var isInvalidUpperCase : Bool!
                var isValidNumeric : Bool!
                var isInvalidNumeric : Bool!
                beforeEach {
                    string = "feLidi@gmail.com"
                    isValidUpperCase = string.hasUpperCase()
                    string = "sjnsunsujsujsu"
                    isInvalidUpperCase = string.hasUpperCase()
                    isInvalidNumeric = string.hasNumericCharacter()
                    string = "sjnsun5sujsujsu"
                    isValidNumeric = string.hasNumericCharacter()
                }
                
                it("with a valid uppercase and numeric string"){
                    expect(isValidUpperCase).to(beTrue())
                    expect(isValidNumeric).to(beTrue())
                }
                
                it("with a invalid uppercase and numeric string"){
                    expect(isInvalidUpperCase).to(beFalse())
                    expect(isInvalidNumeric).to(beFalse())
                }
            }
        }
    }
}
