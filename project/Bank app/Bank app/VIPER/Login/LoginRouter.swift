//
//  LoginRouter.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    func presentDetailView(user: LoginInteractorModel)
}

final class LoginRouter: BaseRouter<LoginPresenterProtocol, LoginView>, LoginRouterProtocol {

    internal func presentDetailView(user: LoginInteractorModel) {

        let homeDTO = HomeDTO()
        let homeUser = HomeUserDTO()
        homeUser.id = user.id
        homeUser.name = user.name
        homeUser.accountNumber = user.accountNumber
        homeUser.agencyID = user.agencyID
        homeUser.balance = user.balance
        
        homeDTO.user = homeUser
        
        let homeView = HomeAssembly.homePresenterView(homeDTO: homeDTO)
        homeView.modalPresentationStyle = .fullScreen
        
        self.present(homeView, animated: true)
    }
}
