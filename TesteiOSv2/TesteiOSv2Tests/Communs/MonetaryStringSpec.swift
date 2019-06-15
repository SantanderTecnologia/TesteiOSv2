//
//  MonetaryStringSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble


@testable import TesteiOSv2

class MonetaryStringSpec : QuickSpec{
    override func spec() {
        describe("MonetaryStringSpec Spec"){
            
            context("Compare values"){
                let value : Double = 1234567899.10
                let stringValue : String = "R$1.234.567.899,10"
                var result : String!
                beforeEach {
                    result = MonetaryString.getValueFormmater(value: value)
                }
                
                it("is not nil"){
                    expect(result).notTo(beNil())
                }
                
                it("is same format"){
                    expect(stringValue == result).notTo(beFalse())
                }
            }
        }
    }
}

