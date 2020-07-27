//
//  Endpoint.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

typealias Parameters = [String:Any]

protocol Endpoint {
    var path: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}
