//
//  ValidateSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 04/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

class ValidateSpy: UserNameValidateProtocol {
    var userName: String?
    fileprivate var isValid = true
    
    func isValid(userName: String?) -> Bool {
        self.userName = userName
        return isValid
    }
    
    func makeInvalid() {
        isValid = false
    }
    
    func makeValid() {
        isValid = true
    }
}
