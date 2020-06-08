//
//  AuthUserViewModel.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Domain

public struct AuthUserViewModel: BaseModel {
    public var userName: String?
    public var password: String?
    
    public init(userName: String?, password: String?) {
        self.userName = userName
        self.password = password
    }
}

extension AuthUserViewModel {
    var authClientModel: AuthClientModel? {
        guard let user = userName, let password = password else { return nil }
        return .init(user: user, password: password)
    }
}
