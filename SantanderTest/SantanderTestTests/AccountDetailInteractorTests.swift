//
//  AccountDetailInteractorTests.swift
//  AccountDetailInteractorTests
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import SantanderTest

class AccountDetailInteractorTests: QuickSpec {

    override func spec() {
        super.spec()
        
        describe("AccountDetailInteractorTests") {
            var sut: AccountDetailInteractor!
            var mockWorker: MockAccountDetailWorker!
            var mockPresenter: MockAccountDetailPresenter!
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = MockAccountDetailWorker()
                mockPresenter = MockAccountDetailPresenter()
                
                let interector = AccountDetailInteractor(with: mockWorker)
                interector.presenter = mockPresenter
                
                sut = interector
                var user = UserAccount()
                user.name = "Jose da Silva Teste"
                sut.user = user
            }
            
            describe("a request to fetch user's statments and populate a list") {

                 context("successful") {
                    
                    it("When requesting statments") {
                        mockWorker.returnType = .success(id: 1)
                        sut.retrieveStaments()
                        
                        expect(sut.height).to(equal(96.0))
                        expect(sut.numberOfRows(in: 0)).to(equal(0))
                        expect(sut.numberOfRows(in: 1)).to(equal(9))
                        expect(sut.configureViewModel(at: IndexPath(row: 0, section: 1))?.date).to(equal("15/08/2018"))
                        expect(sut.configureViewModel(at: IndexPath(row: 0, section: 0))?.date).to(beNil())
                        expect(sut.configureHeaderViewModel(at: 0)?.name).to(equal("Jose da Silva Teste"))
                        expect(sut.configureHeaderViewModel(at: 1)?.name).to(beNil())
                        expect(mockPresenter.hasCalledLoading).to(beTrue())
                        expect(mockPresenter.hasCalledData).to(beTrue())
                    }
                }
                
                 context("failure") {
                    
                    it("when data is empty") {
                        mockWorker.returnType = .failure
                        sut.retrieveStaments()
                        
                        expect(sut.numberOfRows(in: 1)).to(equal(0))
                        expect(mockPresenter.hasCalledLoading).to(beTrue())
                        expect(mockPresenter.hasCalledError).to(beTrue())
                    }
                }

            }
            
            describe("a request to logout from app") {
                context("when requesting logout") {
                    it("logout") {
                        sut.logout()
                        expect(mockPresenter.hasCalledLogout).to(beTrue())
                    }
                }
            }
        }
    }

}
