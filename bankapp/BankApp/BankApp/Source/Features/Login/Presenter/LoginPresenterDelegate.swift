//
//  LoginPresenterDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func set(view: LoginViewDelegate)
    func login(user: String?, password: String?)
    func viewDidLoad()
    func didEditFields(user: String?, password: String?)
}
