//
//  LoginInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginBusinessLogic {
    func fetchLogin(_ request: Login.Info.LoginRequest)
    func fetchSavedLoginInfo(_ request: Login.Info.SavedRequest)
}

protocol LoginDataStore {
    var loginResponse: Login.Info.LoginResponse? { get set }
}

class LoginInteractor: LoginDataStore {
    
    private var presenter: LoginPresentationLogic
    private var worker: LoginWorkerProtocol
    
    var loginResponse: Login.Info.LoginResponse?
    
    init(viewController: LoginDisplayLogic,
         presenter: LoginPresentationLogic = LoginPresenter(),
         worker: LoginWorkerProtocol = LoginWorker()) {
        self.worker = worker
        self.presenter = presenter
        self.presenter.viewController = viewController
    }
}

extension LoginInteractor: LoginBusinessLogic {
    
    func fetchLogin(_ request: Login.Info.LoginRequest) {
        guard checkInputValidity(request) else {
            return
        }
        saveLastUser(request)
        
        worker.fetchLogin(request: request) { response in
            switch response {
            case .success(let user):
                self.loginResponse = user
                self.presenter.didFetchLoginResponse()
                break
            case .error(let error):
                self.presenter.didFetchError(error.localizedDescription)
                break
            case .genericError:
                self.presenter.didFetchError("Generic error")
            }
        }
    }
    
    func fetchSavedLoginInfo(_ request: Login.Info.SavedRequest) {
        let loginInfo = LocalSaves.shared.getUserInfo()
        let response = Login.Saves.User(email: loginInfo.0 ?? .empty, password: loginInfo.1 ?? .empty)
        presenter.didFetchLoginInfo(response)
    }
}

extension LoginInteractor {
    
    private func checkInputValidity(_ request: Login.Info.LoginRequest) -> Bool{
        guard request.user.isValidEmail() else {
            presenter.invalidEmailRequest()
            return false
        }
        guard request.password.hasUppercaseLetter(),
            request.password.hasSpecialCharacters(),
            request.password.hasNumber() else {
            presenter.invalidpasswordRequest()
            return false
        }
        return true
    }
    
    private func saveLastUser(_ request: Login.Info.LoginRequest) {
        LocalSaves.shared.saveLastUser(email: request.user, password: request.password)
    }
}
