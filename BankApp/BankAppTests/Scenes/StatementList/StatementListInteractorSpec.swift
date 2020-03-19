//
//  StatementListInteractorSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
@testable import BankApp

class StatementListInteractorSpec: QuickSpec {

    override func spec() {
        
        describe("StatementListInteractor") {
            
            var sut: StatementListInteractor = StatementListInteractor()
            
            beforeEach {
                sut = StatementListInteractor()
            }
            
            context("doLogin") {

                it("if succeeds, must call presenter.fetchSuccess") {
                    sut.worker = StatementListWorkerMock({ () -> (Result<StatementList.Statements.Response?, Error>) in
                        return Result.success(nil)
                    })

                    let presenter = StatementListPresenterMock()
                    sut.presenter = presenter

                    sut.fetchStatements()

                    expect(presenter.wasSuccessCalled).to(beTruthy())
                    expect(presenter.wasFailureCalled).to(beFalsy())
                }
                
                it("if fails, must call presenter.fetchError") {
                    sut.worker = StatementListWorkerMock({ () -> (Result<StatementList.Statements.Response?, Error>) in
                        return Result.failure(NetworkError.domainError)
                    })
                    
                    let presenter = StatementListPresenterMock()
                    sut.presenter = presenter

                    sut.fetchStatements()
                    
                    expect(presenter.wasSuccessCalled).to(beFalsy())
                    expect(presenter.wasFailureCalled).to(beTruthy())
                }

            }
            
        }
        
    }
    
}
