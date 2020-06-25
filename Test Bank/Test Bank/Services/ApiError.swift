//
//  ApiError.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 22/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case badUrl
    case authenticationRequired
    case brokenData
    case couldNotFindHost
    case couldNotParseObject
    case badRequest
    case unknown(String)
}
