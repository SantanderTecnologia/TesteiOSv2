//
//  StatementListWorkerSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs
@testable import BankApp

class StatementListWorkerSpec: QuickSpec {
    
    override func spec() {
        
        describe("StatementList") {
            
            context("list statements") {
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }

                it("if request succeeds, must return valid object") {
                    
                    // Given
                    stub(condition: isHost("bank-app-test.herokuapp.com") && isPath("/api/statements/1") && isMethodGET()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        let error = OHHTTPStubsResponse(error:notConnectedError)
                        guard let fixtureFile = OHPathForFile("StatementListWorkerfetchStatementsResponseFixture.json", type(of: self)) else { return error }

                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }

                    let sut = StatementListWorker()
                    let request = StatementList.Statements.Request()
                    var statementListResponse: StatementList.Statements.Response?

                    // When
                    waitUntil { done in
                        sut.fetchStatements { (response: Result<StatementList.Statements.Response?, Error>) in
                            switch response {
                            case .success(let response):
                                statementListResponse = response
                                done()
                            case .failure(let error):
                                fail("Mocked response returned error - \(error)")
                                done()
                            }
                        }
                    }

                    // Then
                    expect(statementListResponse).toNot(beNil())
                    expect(statementListResponse?.statementList.count).to(equal(5))
                    
                    expect(statementListResponse?.statementList[0].title).to(equal("Pagamento"))
                    expect(statementListResponse?.statementList[0].desc).to(equal("Conta de luz"))
                    expect(statementListResponse?.statementList[0].date).to(equal("2018-08-15"))
                    expect(statementListResponse?.statementList[0].value).to(equal(-50))
                    
                    expect(statementListResponse?.statementList[1].title).to(equal("TED Recebida"))
                    expect(statementListResponse?.statementList[1].desc).to(equal("Joao Alfredo"))
                    expect(statementListResponse?.statementList[1].date).to(equal("2018-07-25"))
                    expect(statementListResponse?.statementList[1].value).to(equal(745.03))

                    expect(statementListResponse?.statementList[2].title).to(equal("DOC Recebida"))
                    expect(statementListResponse?.statementList[2].desc).to(equal("Victor Silva"))
                    expect(statementListResponse?.statementList[2].date).to(equal("2018-06-23"))
                    expect(statementListResponse?.statementList[2].value).to(equal(399.9))

                    expect(statementListResponse?.statementList[3].title).to(equal("Pagamento"))
                    expect(statementListResponse?.statementList[3].desc).to(equal("Boleto"))
                    expect(statementListResponse?.statementList[3].date).to(equal("2018-08-01"))
                    expect(statementListResponse?.statementList[3].value).to(equal(-200))
                    
                    expect(statementListResponse?.statementList[4].title).to(equal("TED Recebida"))
                    expect(statementListResponse?.statementList[4].desc).to(equal("Salário"))
                    expect(statementListResponse?.statementList[4].date).to(equal("2018-08-21"))
                    expect(statementListResponse?.statementList[4].value).to(equal(1400.5))
                }

                it("if request fails, must execute failure block") {
                    
                    // Given
                    stub(condition: isHost("bank-app-test.herokuapp.com") && isPath("/api/statements/1") && isMethodGET()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        return OHHTTPStubsResponse(error: notConnectedError)
                    }

                    let sut = StatementListWorker()
                    let request = StatementList.Statements.Request()
                    var statementListResponse: StatementList.Statements.Response?

                    // When
                    waitUntil { done in
                        sut.fetchStatements { (response: Result<StatementList.Statements.Response?, Error>) in
                            switch response {
                            case .success(let response):
                                fail("Mocked response returned success")
                                statementListResponse = response
                                done()
                            case .failure(_):
                                done()
                            }
                        }
                    }

                    // Then
                    expect(statementListResponse).to(beNil())
                }

            }
            
        }

    }
    
}

