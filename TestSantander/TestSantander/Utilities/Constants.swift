//
//  Constants.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 07/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//


import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://bank-app-test.herokuapp.com/api"
let URL_LOGIN = "\(BASE_URL)/login"
let URL_STATEMENTS = "\(BASE_URL)/statements/"

// Segues
let TO_CURRENCY = "toCurrency"

//Headers
let BEARER_HEADER = [
    "Content-Type": "application/x-www-form-urlencoded"
]
