//
//  StatementAlamofireGatewaySpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//
import Quick
import Nimble

@testable import TesteiOSv2

class StatementAlamofireGatewaySpec : QuickSpec{
    override func spec() {
        describe("StatementAlamofireGatewaySpec Spec") {
            var statementGateway : StatementAlamofireGateway!
            context("when initilize and fetch statments"){

                var statements : StatementList!
                beforeEach {
                    statementGateway = StatementAlamofireGateway()
                    
                    waitUntil { done in
                        statementGateway.fecthStatements(page: "1", completion: { statementList in
                            statements = statementList
                            done()
                        })
                    }
                    
                }
                
                it("get sucess and statmetList not be nil"){
                    expect(statements).toNot(beNil())
                }
                
            }
        }
    }
}
