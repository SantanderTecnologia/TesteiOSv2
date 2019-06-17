//
//  Errors.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation

enum Errors: Error {
    case noConnectionError(NetworkLayer.TryAgainAction)
    case serverError(String?)
}
