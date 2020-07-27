//
//  ParameterEncoding.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

protocol ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
