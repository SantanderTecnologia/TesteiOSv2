//
//  MockLoginPresenter.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import SantanderTest

class MockLoginPresenter: LoginPresentationLogic {
    
    var hasCalledSuccess = false
    var hasCalledError = false
    var hasCalledLoading = false
    var hasCalledSaved = false
    
    func onSuccess() {
        hasCalledSuccess = true
    }
    
    func onError(title: String, message: String) {
        hasCalledError = true
    }
    
    func shouldPresentLoading(_ isLoading: Bool) {
        hasCalledLoading = true
    }
    
    func shouldPresentSaved(user: String, and password: String) {
        hasCalledSaved = true
    }

}
