//
//  LoginAssembly.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

final class LoginAssembly: BaseAssembly {
    
    static func loginPresenterNavigationController(loginDTO: LoginDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: loginPresenterView(loginDTO: loginDTO))
        return navigationController
    }
    
    static func loginPresenterView(loginDTO: LoginDTO? = nil) -> LoginView {
        let view = LoginView(nibName: BankAppUtils.getXib(xibFile: .loginView), bundle: nil)
        view.presenter = loginPresenter(view: view, loginDTO: loginDTO)
        return view
    }
    
    static fileprivate func loginPresenter(view: LoginView, loginDTO: LoginDTO? = nil) -> LoginPresenterProtocol {
        let presenter = LoginPresenter(view: view)
        presenter.router = loginRouter(presenter: presenter, view: view)
        presenter.interactor = loginInteractor(presenter: presenter, loginDTO : loginDTO)
        return presenter
    }
    
    static fileprivate func loginRouter(presenter: LoginPresenter, view: LoginView) -> LoginRouterProtocol {
        let router = LoginRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func loginInteractor(presenter: LoginPresenterProtocol, loginDTO: LoginDTO? = nil) -> LoginInteractorProtocol {
        let interactor = LoginInteractor(presenter: presenter)
        interactor.loginDTO = loginDTO
        return interactor
    }
}
