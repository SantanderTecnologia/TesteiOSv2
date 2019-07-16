//
//  HomeManagerTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class HomeManagerTest: QuickSpec {

    override func spec() {
        var manager: HomeManager!
        
        describe("HomeManagerTests") {
            beforeSuite {
                manager = HomeManager()
            }
        }
        
        context("HomeManagerOutput") {
            it("HomeManagerOutputNill") {
                expect(manager.output).to(beNil())
            }
        }
    }
}
