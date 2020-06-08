//
//  AuthClientModel.swift
//  Domain
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct AuthClientModel: BaseModel {
    public let user: String
    public let password: String

    public init(user: String, password: String) {
        self.user = user
        self.password = password
    }
}
