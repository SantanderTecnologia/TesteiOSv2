//
//  LoginRepositoryDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

protocol LoginRepositoryDelegate: AnyObject {
    func fetch(params: [String: String], success: @escaping Network<LoginModel>.Success, failure: @escaping Failure)
}
