//
//  LoginInteractorBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginInteractorBuilder {
    static func make() -> LoginInteractor {
        let manager = LoginManager()
        let interactor = LoginInteractor(manager: manager)
        manager.output = interactor
        return interactor
    }
}
