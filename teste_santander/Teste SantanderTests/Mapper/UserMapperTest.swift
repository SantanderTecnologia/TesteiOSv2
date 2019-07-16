//
//  UserMapperTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class UserMapperTest: QuickSpec {
    
    override func spec() {
        
        var userModel: UserModel!
        
        beforeSuite {
            guard let userMock: UserModel = Loader.mock(file: "User") else {
                fail("The JSON file does not exist")
                return
            }
            
            userModel = userMock
        }
        describe("UserTests") {
            
            context("Testing mapper") {

                it("Is Type LoginEntity") {
                    let entity = LoginEntityMapper.create(model: userModel)
                    expect(entity).to(beAKindOf(LoginEntity.self))
                }
    
                it("Is Type UserItem") {
                    let entity = LoginEntityMapper.create(model: userModel)
                    let item =  UserItem.make(loginEntenty: entity)
                    expect(item).to(beAKindOf(UserItem.self))
                }
            }
        }
    }
}
