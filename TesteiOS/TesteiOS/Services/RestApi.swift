//
//  RestApi.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol RestApiProtocol {
    static func doLogin(user: String, password: String, callback: @escaping(_ userAccount: UserAccount?) ->
    Void, error: @escaping () -> Void)
    static func getStatement(id: String, callback: @escaping (_ statements: StatementList?) -> Void, error: @escaping () -> Void)
}

class RestApi: RestApiProtocol {
    static func getStatement(id: String, callback: @escaping (StatementList?) -> Void, error: @escaping () -> Void) {
        let url = Constants.BaseUrl + "/statements/"+id
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseString { (response: DataResponse<String>) in
            
            let statements = Mapper<StatementList>().map(JSONString: response.value!)
//            let response = response.value
            callback(statements)
        }
    }
    
    static func doLogin(user: String, password: String, callback: @escaping(_ userAccount: UserAccount?) ->
        Void, error: @escaping () -> Void) {
        let url = Constants.BaseUrl + "/login"
        AF.request(url, method: .post, parameters: ["user": user, "password": password], encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseString { (response: DataResponse<String>) in
            
            let user = Mapper<User>().map(JSONString: response.value!)
            if user?.userAccount != nil {
                callback(user?.userAccount)
            }
        }

    }
}


