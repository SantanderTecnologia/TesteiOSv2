//
//  PaymentsViewController+Tests.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import XCTest
@testable import Accenture_Challenge

class PaymentsViewController_Tests: XCTestCase, PaymentsDataTransfer {
    
    var dataStore: PaymentsDataStore?
    
    var sut: PaymentsViewController!
    
    override func setUp() {
        sut = PaymentsViewController()
        sut.router = self
    }
    
    override func tearDown() {
        sut = nil
        dataStore = nil
    }
}

extension PaymentsViewController_Tests: PaymentsRoutingLogic {
    
    func routeBack() {
        
    }
}
