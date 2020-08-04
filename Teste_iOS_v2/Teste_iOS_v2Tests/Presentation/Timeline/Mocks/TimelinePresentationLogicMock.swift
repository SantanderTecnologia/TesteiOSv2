//
//  TimelinePresentationLogicMock.swift
//  Teste_iOS_v2Tests
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation
@testable import Teste_iOS_v2

class TimelinePresentationLogicMock: TimelinePresentationLogic {
    var presentTransactionListCalled = false
    var presentInitialStateCalled = false
    
    func presentTransactionList(model: TimelineModels.Response) {
        presentTransactionListCalled = true
    }
    
    func presentInitialState(model: TimelineModels.InitialState) {
        presentInitialStateCalled = true
    }
    
    func clearAllBooleans() {
        presentTransactionListCalled = false
        presentInitialStateCalled = false
    }
    
}
