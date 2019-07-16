//
//  HomePresenterTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class HomePresenterTest: QuickSpec {
    
    override func spec() {
        
        var homePresenter: HomePresenter!
        
        describe("HomePresenterTests") {
            beforeSuite {
                let route = HomeWireframe()
                homePresenter = HomePresenterBuilder.make(wireframe: route)
            }
        }
        
        context("Protocol") {
            it("checking Conforming Protocol") {
                expect(homePresenter).to(beAKindOf(HomePresenterInput.self))
                expect(homePresenter).to(beAKindOf(HomeInteractorOutput.self))
                expect(homePresenter).to(beAKindOf(HomePresenter.self))
            }
        }
        
        context("HomePresenter") {
            it("InteractorNotNill") {
                expect(homePresenter.interactor).notTo(beNil())
            }
        }
        context("HomePresenter") {
            it("OutputNill") {
                expect(homePresenter.output).to(beNil())
            }
        }
    }    
}
