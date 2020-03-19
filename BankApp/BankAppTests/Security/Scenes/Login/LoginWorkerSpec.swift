//
//  LoginWorkerSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs
@testable import BankApp

class LoginWorkerSpec: QuickSpec {
    
    override func spec() {
        
        describe("LoginWorker") {
            
            context("authenticate user") {
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }

                it("if request succeeds, must return valid object") {
                    
                    // Given
                    stub(condition: isHost("bank-app-test.herokuapp.com") && isPath("/api/login") && isMethodPOST()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        let error = OHHTTPStubsResponse(error:notConnectedError)
                        guard let fixtureFile = OHPathForFile("LoginWorkerDoLoginResponseFixture.json", type(of: self)) else { return error }

                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }
                    
                    let sut = LoginWorker()
                    let request = Login.Authentication.Request(login: "", password: "")
                    var loginResponse: Login.Authentication.Response?
                    
                    // When
                    waitUntil { done in
                        sut.doLogin(with: request) { (response: Result<Login.Authentication.Response?, Error>) in
                            switch response {
                            case .success(let response):
                                loginResponse = response
                                done()
                            case .failure(let error):
                                fail("Mocked response returned error - \(error)")
                                done()
                            }
                        }
                    }
                    
                    // Then
                    expect(loginResponse).toNot(beNil())
                    expect(loginResponse?.userAccount).toNot(beNil())
                    expect(loginResponse?.userAccount.userId).to(equal(1))
                    expect(loginResponse?.userAccount.name).to(equal("Jose da Silva Teste"))
                    expect(loginResponse?.userAccount.agency).to(equal("012314564"))
                    expect(loginResponse?.userAccount.bankAccount).to(equal("2050"))
                    expect(loginResponse?.userAccount.balance).to(equal(3.3445))
                }

                it("if request fails, must execute failure block") {
                    
                    // Given
                    stub(condition: isHost("bank-app-test.herokuapp.com") && isPath("/api/login") && isMethodPOST()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        return OHHTTPStubsResponse(error: notConnectedError)
                    }
                    
                    let sut = LoginWorker()
                    let request = Login.Authentication.Request(login: "", password: "")
                    var loginResponse: Login.Authentication.Response?

                    // When
                    waitUntil { done in
                        sut.doLogin(with: request) { (response: Result<Login.Authentication.Response?, Error>) in
                            switch response {
                            case .success(let response):
                                fail("Mocked response returned success")
                                loginResponse = response
                                done()
                            case .failure(_):
                                done()
                            }
                        }
                    }
                    
                    // Then
                    expect(loginResponse).to(beNil())
                }

            }
            
        }

    }
    
}
