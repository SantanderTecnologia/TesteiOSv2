//
//  StatementsInteractorTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class StatementsInteractorTests: QuickSpec {
    
    var interactor: StatementsInteractor!
    var presenter: StatementsPresenterSpy!
    var worker: StatementsWorkerSpy!
    
    class StatementsPresenterSpy: StatementsPresentationLogic {
        
        var displayedStatements: Bool = false
        var errorMessage: String?
        
        func displayStatements(response: Statements.Statements.Response) {
            displayedStatements = true
        }
        
        func displayErrorMessage(message: String) {
            errorMessage = message
        }
        
    }
    
    class StatementsWorkerSpy: StatementsWorker {
        
        var success: Bool = true
        
        override func fetchStatements(userId: Int, callback: @escaping (UserStatements) -> Void) {
            if success {
                callback(Seeds.Statements.statements)
            } else {
                callback(Seeds.Statements.error)
            }
        }
        
    }
    
    fileprivate func setup() {
        interactor = StatementsInteractor()
        interactor.userAccount = Seeds.Users.joao.userAccount
        presenter = StatementsPresenterSpy()
        worker = StatementsWorkerSpy()
        
        interactor.presenter = presenter
        interactor.worker = worker
    }
    
    override func spec() {
        
        describe("Test statements interactor") {
            
            beforeEach {
                self.setup()
            }
            
            it("On empty statements") {
                self.interactor.fetchStatements()
                expect(self.presenter.displayedStatements).to(beTrue())
                expect(self.presenter.errorMessage).to(beNil())
            }
            
            it("On fetch statements") {
                self.interactor.fetchStatements()
                expect(self.presenter.displayedStatements).to(beTrue())
                expect(self.presenter.errorMessage).to(beNil())
            }
            
            it("On fetch error") {
                self.worker.success = false
                self.interactor.fetchStatements()
                
                expect(self.presenter.displayedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(TestConstants.statementsErrorMessage))
            }
            
        }
        
    }
    
}
