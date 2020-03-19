//
//  StatementListPresenter.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation
@testable import BankApp

class StatementListPresenterMock: StatementListPresentationLogic {
    
    var wasSuccessCalled = false
    var wasFailureCalled = false
    
    func fetchSuccess(response: StatementList.Statements.Response?) {
        wasSuccessCalled = true
    }
    
    func fetchError(error: String?) {
        wasFailureCalled = true
    }
    
}
