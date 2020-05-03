//
//  LoginController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 25/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation

protocol UserControllerDelegate: class {
    
    func successLoadUsers()
    func errorLoadUsers(error: Error?)
}

class LoginController {
    
    weak var delegate: UserControllerDelegate?
    
    var provider: LoginProvider?
    
    private var user: Account?
    
    
    func setupController(){
        self.provider = LoginProvider()
        self.provider?.delegate = self
    }
    
    func loadList() {
        self.setupController()
        self.provider?.loadUsers()
    }
    
    func loadCurrentUser(indexPath: IndexPath) -> UserAccount {
        return user?.userAccount ?? UserAccount(userID: 0, name: "", bankAccount: "", agency: "", balance: 0.0)
    }
}


extension LoginController: UserProviderDelegate {
    func successLoadUsers(users: Account) {
        self.user = users
        self.delegate?.successLoadUsers()
    }
    
    func errorLoadUsers(error: Error?) {
        self.delegate?.errorLoadUsers(error: error)
    }
}

