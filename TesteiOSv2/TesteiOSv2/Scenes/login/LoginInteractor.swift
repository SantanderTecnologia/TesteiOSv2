//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    func fetchUserData(username: String, password: String)
}

class LoginInteractor: LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol?
    var repository: LoginRepositoryProtocol = LoginRepository()
    
    func fetchUserData(username: String, password: String) {
        let model = UserAuthModel(name: username, password: password)
        repository.requestLoginData(data: model) { (data) in
            
            self.presenter?.presentUserData(data: data?.userAccount)
            
        }
        
    }
}

