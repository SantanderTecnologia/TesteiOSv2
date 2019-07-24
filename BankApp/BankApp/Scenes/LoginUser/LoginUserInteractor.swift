//
//  LoginUserInteractor.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

protocol LoginUserBusinessLogic {
    func login(_ request: LoginUser.RequestUser.Request)
    func fetchUser(_ request: LoginUser.FetchUser.Request)
}

protocol LoginUserDataStore {
    var user: User! {get set}
}

class LoginUserInteractor: LoginUserBusinessLogic, LoginUserDataStore {
    
    var user: User!
    var worker: UserWorker?
    var presenter: LoginUserPresentationLogic?
    
    
    // MARK: Fecth user
    
    func fetchUser(_ request: LoginUser.FetchUser.Request) {
        worker = UserWorker(UserCoreDataStore())
        worker?.fetchUser() { (user: User?, error: UserStoreError?) in
            if let user = user {
                let response = LoginUser.FetchUser.Response(login: user.login!)
                self.presenter?.presentUser(response)
            }
        }
    }
    
    func login(_ request: LoginUser.RequestUser.Request) {
        worker = UserWorker(UserAPI())
        worker?.login(request.user, password: request.password) { (user: User?) in
            self.user = user
            self.user.login = request.user
            self.user.password = request.password
            self.saveUser(self.user)
        }
    }
    
    private func saveUser(_ user: User) {
        worker = UserWorker(UserCoreDataStore())
        worker?.createUser(user) { (user: User?, error: UserStoreError?) in
            if error == nil {
                DispatchQueue.main.async {
                    self.presenter?.presentUserLogged()
                }
            }
        }
    }
}
