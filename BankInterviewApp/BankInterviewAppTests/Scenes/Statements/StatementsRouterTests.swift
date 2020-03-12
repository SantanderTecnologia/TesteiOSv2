//
//  StatementsRouterTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class StatementsRouterTests: XCTestCase {
    
    let router = StatementsRouter()
    
    override func setUp() {
        
    }
    
    func testBackToLogin() {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let nvc = storyboard.instantiateViewController(identifier: "NavigationController") as UINavigationController
        let createOrderViewController = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as! StatementsViewController
        
        nvc.pushViewController(createOrderViewController, animated: false)
        
        let statementController = nvc.viewControllers.last as! StatementsViewController
        
        router.backToLogin(source: statementController)
        
        //TODO: Como verificar?
    }
    
}
