//
//  LoginRestAPI.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceRestAPI: ServiceStoreProtocol {


    func loginRequest(username: String, password: String, completionHandler: @escaping (() throws -> LoginAPIModel) -> Void) {
        
        let urlLogin = "\(APIService.urlBase)/login"
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        var parameters = [String: Any]()
        if !username.isEmpty && !password.isEmpty {
            parameters = ["user": username, "password": password]
        }
        
        Alamofire.request(urlLogin, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (responseData) in
            var errorCode: String = ""
            var errorMsg: String = ""
            var data: [LoginAPIRequest] = []
            
            if responseData.error != nil {
                let error = responseData.error! as NSError
                errorCode = String(error.code)
                errorMsg = error.description
            }

            
            if responseData.result.value != nil {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if !swiftyJsonVar[APIService.errorMessage].exists() {
                    errorCode = ""
                    errorMsg = swiftyJsonVar[APIService.errorMessage].stringValue
                }
                
                 data.append(LoginAPIRequest(json: swiftyJsonVar))
            }
            
            let result = LoginAPIModel(data: data, message: errorMsg, code: errorCode)
            completionHandler { result }
        }
    }
    
    func statementsRequest(userId: Int, completionHandler: @escaping (() throws -> StatementsAPIModel) -> Void) {
        
        let urlStatements = "\(APIService.urlBase)/statements/\(userId)"
        
        Alamofire.request(urlStatements, method: .get, encoding: URLEncoding.default).responseJSON { (responseData) in
            var errorCode: String = ""
            var errorMsg: String = ""
            var data: StatementsAPIRequest?
            
            if responseData.error != nil {
                let error = responseData.error! as NSError
                errorCode = String(error.code)
                errorMsg = error.description
            }
            
            if responseData.result.value != nil {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if !swiftyJsonVar[APIService.errorMessage].exists() {
                    errorCode = ""
                    errorMsg = swiftyJsonVar[APIService.errorMessage].stringValue
                }
                
                var dataResultStatements: [JSON] = []
                for (key, value) in swiftyJsonVar {
                    if key.contains("statementList") {
                        if !value.isEmpty {
                            dataResultStatements.append(value)
                        }
                    }
                    data = StatementsAPIRequest(statements: dataResultStatements)
                }
            }
            
            let result = StatementsAPIModel(data: data, message: errorMsg, code: errorCode)
            completionHandler { result }
        }
    }
}


