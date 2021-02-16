//
//  LoginProtocols.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation
class LoginProtocols {
    
}

protocol LoginFormProtocol {
    var username: String? { get }
    var password: String? { get }
}

/// View -> Interactor
protocol LoginInteractorProtocol: AnyObject {
    
}

/// Interactor -> Presenter
protocol LoginPresenterProtocol: AnyObject {
    
}

/// Presenter -> View
protocol LoginPresenterDelegate: AnyObject {
}
