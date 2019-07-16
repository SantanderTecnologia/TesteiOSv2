//
//  LoginPresenterBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginPresenterBuilder {
    
    static func make(wireframe: LoginWireframe) -> LoginPresenter {
        let interactor = LoginInteractorBuilder.make()
        let presenter = LoginPresenter(wireframe: wireframe, interactor: interactor)
        interactor.output = presenter
        return presenter
    }
}
