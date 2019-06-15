//
//  SpecialCharacterValidatorSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class SpecialCharacterValidatorSpec : QuickSpec{
    override func spec() {
        describe("SpecialCharacterValidatorSpec Spec") {
            var string : String!
            context("Initilize one string"){
                var isValid : Bool!
                var isInvalid : Bool!
                beforeEach {
                    string = "feldi@gmail.com"
                    isValid = string.hasSpecialCharacters()
                    string = "sjnsunsujsujsu"
                    isInvalid = string.hasSpecialCharacters()
                }
                
                it("with a valid string"){
                    expect(isValid).to(beTrue())
                }
                
                it("with a invalid string"){
                    expect(isInvalid).to(beFalse())
                }
            }
        }
    }
}
