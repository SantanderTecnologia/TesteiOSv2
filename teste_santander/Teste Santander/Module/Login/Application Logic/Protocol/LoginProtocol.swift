//
//  LoginProtocol.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol LoginPresenterInput {
    func send(user: String?, password: String?)
    func didTap()
}

protocol LoginPresenterOutput: class {
    func showErrorUser(title: String)
    func showErrorPassword(title: String)
    func cleanFields()
    func didCloseKeyboard()
    func loading()
    func stopLoading()
    func showAlert(message: String)
}

protocol LoginInteractorInput {
    func fetch(user: String?, password: String?)
}

protocol LoginInteractorOutput: class {
    func errorField(type: FieldType, valid: ErrorField)
    func cleanFields()
    func didlogged()
    func didError(message: String)
}

protocol LoginManagerOutput: class {
    func fetched(with user: LoginEntity)
    func error(error: Error)
}
