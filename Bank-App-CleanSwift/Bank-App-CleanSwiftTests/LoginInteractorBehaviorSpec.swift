//
//  LoginInteractorBehaviorSpec.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 16/03/21.
//

import Foundation
import Quick
import Nimble
@testable import Bank_App_CleanSwift

class LoginInteractorBehaviorSpec: QuickSpec {
    let loginInteractorDouble = LoginInteractorDouble()
        
    override func spec() {
        beforeEach {
            self.loginInteractorDouble.doTryLogin(request: Stubs.REQUEST_MODEL_STUB)
        }
        
        describe("Behavior Test") {
            context("when validating an user by its fields") {
                it("should sinalize that the methods was called") {
                    expect(self.loginInteractorDouble.applyBusinessLogicWasCalled).to(beTrue())
                    expect(self.loginInteractorDouble.validateFieldsWasCalled).to(beTrue())
                }
            }
            
        }
        
    }
}
