//
//  NetworkTests.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//


import XCTest
import Quick
import Nimble
import PromiseKit
@testable import SantanderTest


class NetworkTests: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("NetworkTests") {
            let url = URL(string: "https://bank-app-test.herokuapp.com/api")
            var urlRequest = URLRequest(url: url!)
            
            describe("encondig JSON parameters") {
                context("successful") {
                    it("when requesting login") {
                        let params: [String: Any] = [
                            "user" : "user",
                            "password" : "123"
                        ]
                        try! JSONParameterEncoder.encode(urlRequest: &urlRequest, with: params)
                        expect(urlRequest.httpBody?.isEmpty).to(beFalse())
                    }
                }
            }
            
            describe("decoding JSON OBJECT") {
                let reader = JSONFileReader()
                context("successful") {
                    it("when requesting login response") {
                        let data = reader.read(filename: "login")
                        let obj = try! JSONDataDecoder.decode(Login.Response.self, data: data)
                        expect(obj.userAccount?.userID).to(equal(1))
                    }
                }
                context("failure") {
                    it("when data is empty") {
                        let data = reader.read(filename: "emptyBody")
                        let obj = try! JSONDataDecoder.decode(Login.Response.self, data: data)
                        expect(obj.userAccount).to(beNil())
                    }
                    it("when parser error") {
                        let data = reader.read(filename: "login")
                        let obj = try! JSONDataDecoder.decode(AccountDetail.Response.self, data: data)
                        expect(obj.statementList).to(beNil())
                    }
                }
            }
            
            describe("API Service") {
                context("login") {
                    let loginService: APIService = .login(user: "user", password: "123456")
                    expect(loginService.path).to(equal("/api/login"))
                    expect(loginService.url?.absoluteString).to(equal("https://bank-app-test.herokuapp.com/api/login"))
                    expect(loginService.method).to(equal(.post))
                    expect(loginService.parameters?.keys.first).to(equal("user"))
                    expect(loginService.parameters?.values.first as? String).to(equal("user"))
                }
                context("statements") {
                    let statementsService: APIService = .statements(id: 1)
                    expect(statementsService.path).to(equal("/api/statements/1"))
                    expect(statementsService.url?.absoluteString).to(equal("https://bank-app-test.herokuapp.com/api/statements/1"))
                    expect(statementsService.method).to(equal(.get))
                    expect(statementsService.parameters).to(beNil())
                }
            }
        }
    }
}
