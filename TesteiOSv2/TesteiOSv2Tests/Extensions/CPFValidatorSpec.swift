//
//  CPFValidatorSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//
import Quick
import Nimble

@testable import TesteiOSv2

class CPFValidatorSpec : QuickSpec{
    override func spec() {
        describe("CPFValidatorSpec Spec") {
            var cpf : String!
            context("Initilize one cpf string"){
                var isValid : Bool!
                var isInvalid : Bool!
                beforeEach {
                    cpf = "02875178105"
                    isValid = cpf.isValidCPF
                    cpf += "9"
                    isInvalid = cpf.isValidCPF
                }
                
                it("with a valid cpf"){
                    expect(isValid).to(beTrue())
                }
                
                it("with a invalid cpf"){
                    expect(isInvalid).to(beFalse())
                }
            }
        }
    }
}
