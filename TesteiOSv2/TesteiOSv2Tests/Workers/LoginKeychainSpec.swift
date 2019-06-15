//
//  LoginKeychainSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class LoginKeychainSpec : QuickSpec{
    override func spec() {
        describe("LoginKeychainSpec Spec") {
            var loginKeychain : LoginKeychain!
            context("when initilize"){
                var username : String!
                var password : String!
                beforeEach {
                    loginKeychain = LoginKeychain()
                    username = "111111"
                    password = "123456"
                    
                    if let named = loginKeychain.getUsername(){
                        username = named
                    }else{
                        username = "111111"
                    }
                    username = loginKeychain.getUsername()
                    loginKeychain.save(user: username)
                    loginKeychain.save(password: password)
                }
                
                it("get username and not be nil"){
                expect(loginKeychain.getUsername()).toNot(beNil())
                    expect(loginKeychain.getUsername() == username).to(beTrue())
                }
                it("get passwaord and not be nil"){
                    expect(loginKeychain.getPassword()).toNot(beNil())
                    expect(loginKeychain.getPassword() == password).to(beTrue())
                }
            }
        }
    }
}
