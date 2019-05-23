//
//  MainTablePresenterDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

protocol MainTablePresenterDelegate: AnyObject {
    var numberOfRows: Int { get }
    var bankInfo: String { get }
    var balanceInfo: String { get }
    var userName: String { get }
    
    func set(view: MainTableViewDelegate)
    func statement(for index: Int) -> StatementModel?
    
    func logout()
    
    func viewDidLoad()
    
}
