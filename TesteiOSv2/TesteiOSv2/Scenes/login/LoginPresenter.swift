//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func presentUserData(data: UserInfo?)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var controller: LoginViewControllerProtocol?
    
    func presentUserData(data: UserInfo?) {
        //
        controller?.showUserData(data:data)
    }
    
}
