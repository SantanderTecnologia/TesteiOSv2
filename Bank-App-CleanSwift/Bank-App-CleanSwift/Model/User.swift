//
//  User.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation


/// User for use in store processinc
struct User: Codable {
    let username: String
    let password: String
}

// MARK: -
/// Struct for request body parameters
struct UserParameters: Encodable {
    let user: String
    let password: String
}
// MARK: -
/// struct for request body parameters. As the api allow any user to login, a way to force an error code 53 is change the parameter names
struct UserWrongParameters: Encodable {
    let uzer: String
    let pazzvord: String
}

// MARK: - structs for use in response
/// Struct for decoding `user`. It can contain an `ErrorData` or an `UserAccount`
struct UserData: Decodable {
    let error: ErrorData
    let userAccount: UserAccountData
    
    struct ErrorData: Decodable {
        let code: Int?
        let message: String?
        
        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
    
    struct UserAccountData: Decodable {
        let userId: Int?
        let name: String?
        let bankAccount: String?
        let agency: String?
        let balance: Double?
        
        enum CodingKeys: String, CodingKey {
            case userId
            case name
            case bankAccount
            case agency
            case balance
        }        
    }
}

// MARK: - structs for use in response. "POSO" objects
/// Marker protocol, used for polimorphism.
protocol JSONDataExtractable {}

/// Class for use when a request was made with correct parameters.
class UserAccount: JSONDataExtractable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
        
    /// Constructor for use when creating an object of this class inside a request.
    /// - Parameter userData: the data returned from a `request`
    init(extractedFrom userData: UserData) {
        self.userId = userData.userAccount.userId
        self.name = userData.userAccount.name
        self.bankAccount = userData.userAccount.bankAccount
        self.agency = userData.userAccount.agency
        self.balance = userData.userAccount.balance
    }
    
    /// Constructor for use when creating an object of this class in hard-coded way
    /// - Parameters:
    ///   - userId: an `Int` representing an id of an user
    ///   - name: a `String` representing the name of the user
    ///   - bankAccount: a `String` representing a bank account
    ///   - agency: a `String` representing an agency of the user's bank account
    ///   - balance: a `Double` representing the total amount of the user
    init(userId: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

/// Class for use when a request was made wth incorrect parameters
class ErrorMessage: JSONDataExtractable {
    var code: Int?
    var message: String?
        
    /// Constructor for use when creating an object of this class inside a request
    /// - Parameter userData: the data returned from a `request`
    init(extractedFrom userData: UserData) {
        self.code = userData.error.code
        self.message = userData.error.message
    }
    
    
    /// Constructor for use when creating an object of this class in hard-coded way
    /// - Parameters:
    ///   - code: An `Int`error code (returned by the API or based on some business logic)
    ///   - message: A `String` representing an error message
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}

