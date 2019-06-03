//
//  StatementsPresenterTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class StatementsPresenterTests: QuickSpec {
    
    var presenter: StatementsPresenter!
    var viewController: StatementsViewControllerSpy!
    
    class StatementsViewControllerSpy: StatementsDisplayLogic {
        
        var displayedStatements: Bool = false
        var errorMessage: String?
        
        func displayStatements(viewModel: Statements.Statements.ViewModel) {
            displayedStatements = true
        }
        
        func displayErrorMessage(message: String) {
            errorMessage = message
        }
        
    }
    
    fileprivate func setup() {
        presenter = StatementsPresenter()
        viewController = StatementsViewControllerSpy()
        presenter.viewController = viewController
    }
    
    override func spec() {
        
        describe("Test statements presenter") {
            
            beforeEach {
                self.setup()
            }
            
            it("On display statements") {
                let response = Statements.Statements.Response()
                self.presenter.displayStatements(response: response)
                
                expect(self.viewController.displayedStatements).to(beTrue())
                expect(self.viewController.errorMessage).to(beNil())
            }
            
            it("On display error message") {
                self.presenter.displayErrorMessage(message: TestConstants.statementsErrorMessage)
                
                expect(self.viewController.displayedStatements).toNot(beTrue())
                expect(self.viewController.errorMessage).toNot(beNil())
                expect(self.viewController.errorMessage ?? "").to(equal(TestConstants.statementsErrorMessage))
            }
            
        }
        
    }
    
}
