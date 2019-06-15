//
//  UserLoginAlamofireGatewaySpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class UserLoginAlamofireGatewaySpec : QuickSpec{
    override func spec() {
        describe("UserLoginAlamofireGatewaySpec Spec") {
            var loginGateway : UserLoginAlamofireGateway!
            context("when initilize"){
                var username : String!
                var password : String!
                var user : UserAccount!
                beforeEach {
                    loginGateway = UserLoginAlamofireGateway()
                    username = "111111"
                    password = "123456"
                    
                    waitUntil { done in
                        loginGateway.authLogin(user: username, password: password, completion: { result in
                            user = result
                            done()
                        })
                    }

                }
                
                it("get sucess and user not be nil"){
                    expect(user).toNot(beNil())
                }

            }
        }
    }
}
