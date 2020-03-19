//
//  UserDataModel.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 18/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation

struct UserDataModel: Codable {
    
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double

}
