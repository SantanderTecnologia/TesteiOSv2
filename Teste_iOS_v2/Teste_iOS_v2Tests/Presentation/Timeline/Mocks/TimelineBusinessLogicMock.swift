//
//  TimelineBusinessLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class TimelineBusinessLogicMock: TimelineBusinessLogic {
    var getTransactionsCalled = false
    var setupInitialStateCalled = false
    
    func getTransactions() {
        getTransactionsCalled = true
    }
    
    func setupInitialState() {
        setupInitialStateCalled = true
    }
    
    func clearAllBooleans() {
        getTransactionsCalled = false
        setupInitialStateCalled = false
    }
    
}
