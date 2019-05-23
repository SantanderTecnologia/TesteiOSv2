//
//  MainTableRepositoryDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

typealias MainTableSuccess = (_: [StatementModel]) -> Void

protocol MainTableRepositoryDelegate: AnyObject {
    func fetch(id: Int, success: @escaping MainTableSuccess, failure: @escaping Failure)
}
