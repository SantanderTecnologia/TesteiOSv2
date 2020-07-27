//
//  MockAccountDetailPresenter.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import SantanderTest

class MockAccountDetailPresenter: AccountDetailPresentationLogic {
    
    var hasCalledError = false
    var hasCalledLoading = false
    var hasCalledData = false
    var hasCalledLogout = false
    
    func onError(title: String, message: String) {
        hasCalledError = true
    }
    
    func shouldPresentLoading(_ isLoading: Bool) {
        hasCalledLoading = true
    }
    
    func presentData() {
        hasCalledData = true
    }
    
    func performLogout() {
        hasCalledLogout = true
    }
    
}
