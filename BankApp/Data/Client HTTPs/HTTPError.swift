//
//  HTTPError.swift
//  Data
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public enum HTTPError: Error {
    case unknown
    case noConnectivity
    case invalidRequest
    case forbidden
    case internalServer
    case unauthorized
    case notFound
    case noData
}
