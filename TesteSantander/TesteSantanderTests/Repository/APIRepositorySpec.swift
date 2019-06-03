//
//  APIRepositorySpec.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
import Moya
import RxBlocking

@testable import TesteSantander

class APIRepositorySpec: QuickSpec {
    
    override func spec() {
        
        var repository: APIRepository!
        
        describe("Test success repository") {
            
            beforeEach {
                repository = MockAPIRepository(success: true, service: MockAPIService())
            }
            
            it("Get success user") {
                do {
                    let result = try repository.login(user: "", password: "").toBlocking().first()
                    expect(result).toNot(beNil())
                    
                    // Test user info
                    expect(result?.userAccount.userId) == Seeds.Users.joao.userAccount.userId
                    expect(result?.userAccount.name) == Seeds.Users.joao.userAccount.name
                    expect(result?.userAccount.agency) == Seeds.Users.joao.userAccount.agency
                    expect(result?.userAccount.bankAccount) == Seeds.Users.joao.userAccount.bankAccount
                    expect(result?.userAccount.balance) == Seeds.Users.joao.userAccount.balance
                    
                    // Test error info
                    expect(result?.error.code).to(beNil())
                    expect(result?.error.message).to(beNil())
                } catch let error {
                    fatalError(error.localizedDescription)
                }
            }
            
            it("Get success statements") {
                do {
                    let result = try repository.fetchStatements(userId: 1).toBlocking().first()
                    expect(result).toNot(beNil())
                    
                    // Test user info
                    expect(result?.statementList.count).to(equal(3))
                    
                    // Test error info
                    expect(result?.error.code).to(beNil())
                    expect(result?.error.message).to(beNil())
                } catch let error {
                    fatalError(error.localizedDescription)
                }
            }
            
        }
        
        describe("Test empty repository") {
            
            beforeEach {
                let mockRepository = MockAPIRepository(success: true, service: MockAPIService())
                mockRepository.emptyResponse = true
                repository = mockRepository
            }
            
            it("Get empty statements") {
                do {
                    let result = try repository.fetchStatements(userId: 1).toBlocking().first()
                    expect(result).toNot(beNil())
                    
                    // Test user info
                    expect(result?.statementList).to(beEmpty())
                    
                    // Test error info
                    expect(result?.error.code).to(beNil())
                    expect(result?.error.message).to(beNil())
                } catch let error {
                    fatalError(error.localizedDescription)
                }
            }
            
        }
        
        describe("Test error repository") {
            
            beforeEach {
                repository = MockAPIRepository(success: false, service: MockAPIService())
            }
            
            it("Get error user") {
                do {
                    let _ = try repository.login(user: "", password: "").toBlocking().first()
                    fatalError(TestConstants.flowError)
                } catch let error as APIError {
                    // Test error info
                    expect(error.code).to(equal(TestConstants.loginErrorCode))
                    expect(error.message).to(equal(TestConstants.loginErrorMessage))
                } catch let error {
                    fatalError(error.localizedDescription)
                }
            }
            
            it("Get error statements") {
                do {
                    let _ = try repository.fetchStatements(userId: 1).toBlocking().first()
                    fatalError(TestConstants.flowError)
                } catch let error as APIError {
                    // Test error info
                    expect(error.code).to(equal(TestConstants.statementsErrorCode))
                    expect(error.message).to(equal(TestConstants.statementsErrorMessage))
                } catch let error {
                    fatalError(error.localizedDescription)
                }
            }
            
        }
        
    }
    
}
