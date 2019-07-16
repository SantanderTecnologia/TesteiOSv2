//
//  LoginManager.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import KeychainSwift

class LoginManager {
    
    let baseUrl = "https://bank-app-test.herokuapp.com/api/login"
        
    weak var output: LoginManagerOutput?
    
    func fetch(user: String, password: String) {
        let parameters: Parameters = [
            "user": user,
            "password": password
        ]
        
        Alamofire.request(baseUrl, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                
                if let errorModel =  Mapper<ErrorModel>().map(JSONObject:response.result.value), errorModel.code != 0 {
                    let userInfo: [String : Any] =
                        [
                            NSLocalizedDescriptionKey :  NSLocalizedString(errorModel.message, value: errorModel.message, comment: "") ,
                            NSLocalizedFailureReasonErrorKey : NSLocalizedString(errorModel.message, value: errorModel.message, comment: "")
                        ]
                    let error = NSError(domain: "br.com.thgdigital.teste", code: errorModel.code, userInfo: userInfo)
                    self.output?.error(error: error)
                    return
                }
                
                guard let userModel = Mapper<UserModel>().map(JSONObject:response.result.value), let dataUser = response.data else { return }
                self.saveUser(with: dataUser)
                self.output?.fetched(with: LoginEntityMapper.create(model: userModel))
            case .failure(let error):
               self.output?.error(error: error)
            }
        }
    }
    
    func saveUser(with user: Data) {
        let keychain = KeychainSwift()
        keychain.set(user, forKey: "userData")
        keychain.synchronizable = true
    }
}
