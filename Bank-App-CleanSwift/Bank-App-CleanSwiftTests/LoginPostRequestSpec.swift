//
//  LoginPostRequestSpec.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation
import Quick
import Nimble
import Alamofire
@testable import Bank_App_CleanSwift

class LoginPostRequestSpec: QuickSpec {
    override func spec() {
        var worker: LoginHTTPRequestWorker!
        
        beforeEach {
            worker = LoginHTTPRequestWorker()
        }
        
        describe("#Post Request") {
            context("when user and password are correct") {
                it("should return error as nil object") {
                    worker.doLogin(with: Stubs.VALID_USER) { data in
                        expect(data.error.code).to(beNil())
                    }
                }
                
                it("should return Jose da Silva Teste as name") {
                    waitUntil(timeout: DispatchTimeInterval.seconds(15)) { done in
                        worker.doLogin(with: Stubs.VALID_USER) { data in
                            expect(data.userAccount.name).to(equal("Jose da Silva Teste"))
                            done()
                        }
                    }
                }
                
                it("should return false when comparing with a different name") {
                    waitUntil(timeout: DispatchTimeInterval.seconds(15)) { done in
                        worker.doLogin(with: Stubs.VALID_USER) { data in
                            expect(data.userAccount.name == "Kevin Bacon").to(beFalse())
                            done()
                        }
                    }
                }
            }
            
            context("when user and password are incorrect") {
                it("should retur error 53") {
                    // The api does not validate properly an user (any user can log in). Only if the parameter names
                    // are incorrect, the api presents an error. Because of this issue, It is necessary to do some of
                    // boilerplate code as follow (instead of testing worker object only)
                    
                    let endpoint = "https://bank-app-test.herokuapp.com/api/login/"
                    let headers: HTTPHeaders = [.contentType("application/json; charset=utf-8")]
                                                
                    let request = AF.request(endpoint,
                                             method: .post,
                                             // here it is passed as parameters a 'mombojombo' parameter, to enforce
                                             // error message from api.
                                             parameters: Stubs.WRONG_PARAMETERS,
                                             encoder: JSONParameterEncoder.default,
                                             headers: headers)
                    
                    waitUntil(timeout: DispatchTimeInterval.seconds(15)) { done in
                        request.responseDecodable(of: UserData.self) { response in
                            expect(response.value?.error.code).to(equal(53))
                            done()
                        }
                    }
                }
            }
        }
        
        afterEach {
            
        }
    }
}
