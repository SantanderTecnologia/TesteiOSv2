//
//  LoginPresenter.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterInput {
    
    weak var output: LoginPresenterOutput?
    
    var wireframe: LoginWireframe
    
    var interactor: LoginInteractorInput
    
    init(wireframe: LoginWireframe, interactor: LoginInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func send(user: String?, password: String?) {
        output?.loading()
        output?.didCloseKeyboard()
        interactor.fetch(user: user, password: password)
    }
    
    func titleMessage(valid: ErrorField) -> String {
        switch valid {
        case .empty:
            return "Erro existe dados em branco"
        case .valid:
            return "Sua senha não conferer com os criterios de validação"
            
        case .cpfEmail:
            return "Por favor forneça um e-mail válido ou CPF válido"
        }
    }
    
    func didTap() {
        output?.didCloseKeyboard()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func didError(message: String) {
        output?.cleanFields()
        output?.stopLoading()
        output?.showAlert(message: message)
    }
    
    
    func didlogged() {
        output?.stopLoading()
        wireframe.showDetailUser()
    }
    
    
    func cleanFields() {
        output?.cleanFields()
    }
    
    func errorField(type: FieldType, valid: ErrorField) {
        output?.stopLoading()
        
        switch type {
        case .password:
            output?.showErrorPassword(title: titleMessage(valid: valid))
        case .user:
            output?.showErrorUser(title: titleMessage(valid: valid))
        }
    }
}
