//
//  TimelineDisplayLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class TimelineDisplayLogicMock: TimelineDisplayLogic {
    var displayTransactionListCalled = false
    var displayInitialStateCalled = false
    
    func displayTransactionList(model: TimelineModels.Response) {
        displayTransactionListCalled = true
    }
    
    func displayInitialState(model: TimelineModels.InitialState) {
        displayInitialStateCalled = true
    }
    
    func clearAllBooleans() {
        displayTransactionListCalled = false
        displayInitialStateCalled = false
    }
    
}
