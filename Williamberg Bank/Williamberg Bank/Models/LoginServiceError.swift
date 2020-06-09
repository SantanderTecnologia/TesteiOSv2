//
//  LoginServiceError.swift
//  Williamberg Bank
//
//  Created by padrao on 23/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import Foundation

struct LoginServiceError: Codable {
    let code: Int
    let message: String
}
