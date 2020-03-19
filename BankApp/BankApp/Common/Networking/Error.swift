//
//  Error.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 18/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation

///
/// Supported Network Errors
///
public enum NetworkError: Error {

    ///
    /// Error happened while trying to decode given data to the given type.
    ///
    case decodingError

    ///
    /// Data returned from the backend was not properly parsed to given type.
    ///
    case domainError

}
