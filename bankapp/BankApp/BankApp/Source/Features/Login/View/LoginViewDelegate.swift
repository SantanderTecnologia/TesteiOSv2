//
//  LoginViewDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    func showAlert(message: String)
    func setLoadingHidden(isHidden: Bool)
    func setButtonEnabled(isEnabled: Bool)
    func setFields(user:String, password: String)
}
