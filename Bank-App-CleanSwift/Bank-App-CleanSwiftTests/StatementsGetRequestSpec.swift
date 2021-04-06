//
//  StatementsGetRequestSpec.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation
import Quick
import Nimble
import Alamofire

@testable import Bank_App_CleanSwift

class StatementsGetRequestSpec: QuickSpec {
    var worker: ShowStatementsHTTPRequestWorker!
    override func spec() {
        
        beforeEach {
            self.worker = ShowStatementsHTTPRequestWorker()
        }
        
        describe("#Get request") {
            context("when the user id is a valid user id") {
                it("returns a list of statements") {
                    waitUntil(timeout: DispatchTimeInterval.seconds(15)) { done in
                        let validId = 1
                        self.worker.fetchStatements(ofUser: validId) { (data) in
                            expect(data.statementList).toNot(beNil())
                            done()
                        }
                    }
                }
            }
            
            // As the api is 'mocked', every int passed by parameter returns the same statements.
            // for testing purposes, a letter will be a parameter.
            // Because the explanation above, it is necessary to implement the inner state of worker object.
            context("when the parameter userIs is invalid") {
                it("returns code 53") {
                    let badParameter = "x"
                    let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(badParameter)"
                    let request = AF.request(endpoint)
                    
                    waitUntil(timeout: DispatchTimeInterval.seconds(15)) { done in
                        request.responseDecodable(of: StatementListData.self) { response in
                            if let data = response.value {
                                expect(data.error.code).toNot(beNil())
                                expect(data.error.code).to(equal(53))
                                expect(data.error.code).toNot(equal(40))
                                done()
                            }
                        }
                    }
                }
            }
        }
    }
}
