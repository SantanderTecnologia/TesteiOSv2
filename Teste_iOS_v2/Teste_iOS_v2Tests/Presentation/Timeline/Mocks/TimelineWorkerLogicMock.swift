//
//  TimelineWorkerLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class TimelineWorkerLogicMock: TimelineWorkerLogic {
    var retrieveTransactionCalled = false
    
    func retrieveTransaction(model: TimelineModels.Request) {
        retrieveTransactionCalled = true
    }
    
    func clearAllBooleans() {
        retrieveTransactionCalled = false
    }
}
