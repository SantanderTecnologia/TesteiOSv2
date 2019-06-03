//
//  StatementsViewControllerTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class StatementsViewControllerTests: QuickSpec {
    
    var viewController: StatementsViewController!
    var interactor: StatementsInteractorSpy!
    var window: UIWindow!
    
    class StatementsInteractorSpy: StatementsBusinessLogic {
        
        var statementsLoaded: Bool = false
        
        func fetchStatements() {
            statementsLoaded = true
        }
        
    }
    
    fileprivate func setup() {
        window = UIWindow()
        viewController = StatementsViewController()
        interactor = StatementsInteractorSpy()
        viewController.interactor = interactor
        
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    override func spec() {
        
        describe("Test statements view controller") {
            
            beforeEach {
                self.setup()
            }
            
            it("On loaded screen, should fetch statements") {
                self.viewController.viewDidLoad()
                expect(self.interactor.statementsLoaded).to(beTrue())
            }
            
        }
        
    }
    
}
