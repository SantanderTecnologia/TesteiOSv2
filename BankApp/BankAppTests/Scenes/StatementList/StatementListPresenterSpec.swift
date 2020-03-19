//
//  StatementPresenterSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
@testable import BankApp

class StatementListPresenterSpec: QuickSpec {
    
    override func spec() {
        
        describe("StatementListPresenter") {
            
            var sut: StatementListPresenter? = StatementListPresenter()
            
            beforeEach {
                sut = StatementListPresenter()
            }
            
            context("fetchSuccess") {
                
                it("must set viewModel with value and no error") {
                    let viewController = StatementListViewControllerMock()
                    sut?.viewController = viewController
                    
                    let response = StatementList.Statements.Response(statementList: [])

                    sut?.fetchSuccess(response: response)
                    expect(viewController.viewModel).toNot(beNil())
                    expect(viewController.viewModel?.statementList).toNot(beNil())
                    expect(viewController.viewModel?.errorMessage).to(beNil())
                }
                
            }

            context("fetchError") {
                
                it("must set viewModel with no value and an error defined") {
                    let viewController = StatementListViewControllerMock()
                    sut?.viewController = viewController

                    sut?.fetchError(error: "Error")
                    expect(viewController.viewModel).toNot(beNil())
                    expect(viewController.viewModel?.statementList).to(beNil())
                    expect(viewController.viewModel?.errorMessage).toNot(beNil())
                }
                
            }
            
        }
        
    }
    
}

