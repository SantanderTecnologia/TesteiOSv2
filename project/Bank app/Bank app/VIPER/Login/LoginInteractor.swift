//
//  LoginInteractor.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInteractorProtocol: AnyObject {
    var loginInteractorModel : LoginInteractorModel? {get set}
    var loginDTO: LoginDTO? {get set}
    
    func performLogin(username: String, password: String, completion: @escaping(_ loginModelEntity : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void)
    
    func cleanup()
}

final class LoginInteractor: BaseInteractor<LoginPresenterProtocol>, LoginInteractorProtocol {
    var InteractorID = "LoginInteractor"
    var loginInteractorModel : LoginInteractorModel?
    var loginDTO: LoginDTO? {
        didSet{
            self.presenter?.updateViewModel(password: loginDTO?.password, username: loginDTO?.username)
        }
    }
    var cdlUser = CDLUser()
    
    func performLogin(username: String, password: String, completion: @escaping(_ loginSuccess : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void){
        if (password.hasNumberCharacters() && password.hasSpecialCharacters() && password.hasUperCaseCharacters()){
            cdlUser.performLogin(username: username, password: password, subscriber: (
                InteractorID, { ( response: CDLResponse? ) -> Void in
                    
                    if let cdlResponse = response {
                        switch cdlResponse {
                        case .failure(let error):
                            completion(nil, LoginInteractorError.convertCDLErrorToInteractorError(cdlError: error))
                            break
                        case .success(let model):
                            if let loginCDLModel = model as? CDLUserResponseModel {
                                if let responseError = loginCDLModel.error, self.isValidError(cdlUserError: responseError) , let errorMessage = responseError.message{
                                    //has error and needs to be handled
                                    completion(nil, LoginInteractorError.customServerError(errorMessage))
                                    return
                                }
                                if let userModel = loginCDLModel.userAccount, self.isValidUser(cdlUser: userModel) {
                                    //is a valid user
                                    //clear old keychain values
                                    KeychainUtils.shared.deletePassword()
                                    KeychainUtils.shared.deleteUsername()
                                    
                                    //save new keychain values
                                    _ = KeychainUtils.shared.savePassword(password: password)
                                    _ = KeychainUtils.shared.saveUsername(username: username)
                                    
                                    self.loginInteractorModel = LoginInteractorModel(cdlUser: userModel)
                                    completion(self.loginInteractorModel, nil)
                                    return
                                }
                                
                                // error and user objects are not valid
                                completion(nil, LoginInteractorError.defaultError)
                                return
                            }else{
                                "cdl response is invalid".errorLog()
                                completion(nil, LoginInteractorError.genericServerError)
                            }
                            break
                        }
                    }else{
                        "cdl response is nil".errorLog()
                        completion(nil, LoginInteractorError.genericServerError)
                    }
            }))
        }else{
            completion(nil, LoginInteractorError.noValidPasswordError)
        }
    }
    
    private func isValidUser(cdlUser: CDLUserModel) -> Bool{
        if(cdlUser.id != nil && cdlUser.name != nil && cdlUser.accountNumber != nil && cdlUser.agencyID != nil && cdlUser.balance != nil){
            return true
        }
        return false
    }
    
    private func isValidError(cdlUserError: CDLUserErrorModel) -> Bool {
        if(cdlUserError.message == nil || cdlUserError.errorCode == nil){
            return false
        }
        return true
    }
    
    func cleanup(){
        cdlUser.cleanup(subscriberID: InteractorID)
    }
}


enum LoginInteractorError{
    case noValidPasswordError
    case genericServerError
    case internetError
    case customServerError(String)
    case defaultError
    
    
    static func convertCDLErrorToInteractorError(cdlError: CDLErrorType) -> LoginInteractorError{
        switch cdlError {
        case .networkError(let error):
            return .internetError
        default:
            break
        }
        
        return defaultError
    }
}
