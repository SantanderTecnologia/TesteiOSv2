//
//  ResultError.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

struct ResultError: Decodable {
    let code: Int?
    let message: String?
}
