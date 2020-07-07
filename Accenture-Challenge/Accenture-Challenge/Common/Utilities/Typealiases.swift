//
//  Typealiases.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

typealias TableViewProtocol = UITableViewDelegate & UITableViewDataSource
typealias APIResponseCallback = (APIResponse) -> Void
typealias LoginResponseCallback = (LoginResponse) -> Void
typealias StatementsCallback = (PaymentsResponse) -> Void
