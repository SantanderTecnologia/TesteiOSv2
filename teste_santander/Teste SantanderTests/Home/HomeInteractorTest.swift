//
//  HomeInteractorTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class HomeInteractorTest: QuickSpec {

    override func spec() {
        var interactor: HomeInteractor!
        
        describe("HomeInteractorTests") {
            beforeSuite {
                interactor = HomeInteractorBuilder.make()
            }
        }
        context("Protocol") {
            it("checking Conforming Protocol") {
                expect(interactor).to(beAKindOf(HomeInteractorInput.self))
                expect(interactor).to(beAKindOf(HomeManagerOutput.self))
                expect(interactor).to(beAKindOf(HomeInteractor.self))
            }
        }
        context("Checked Manager") {
            it("checking manager") {
                expect(interactor.manager).notTo(beNil())
            }
        }
    }
}
