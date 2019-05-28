//
//  RestApi.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

protocol RestApiProtocol {
    static func GetStatments(id: String, callback: @escaping (_ statments: Statments?) -> Void, error: @escaping () -> Void)
    static func doLogin(user: String, password: String, callback: @escaping (_ userAccount: UserAccount?) -> Void, error: @escaping () -> Void)
}

class RestApi: RestApiProtocol {
    
    public static func doLogin(user: String, password: String, callback: @escaping (_ userAccount: UserAccount?) -> Void, error: @escaping () -> Void) {
        let url = Constants.BASEURL + "/login"
        Alamofire.request(url, method: .post, parameters: ["user": user, "password": password], encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<User>) in

            let user = response.result.value
            if user?.userAccount != nil {
                callback(user?.userAccount)
            }
        }
    }

    public static func GetStatments(id: String, callback: @escaping (_ statments: Statments?) -> Void, error: @escaping () -> Void) {
        let url = Constants.BASEURL + "/statements/" + id
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<Statments>) in
            let response = response.result.value
            callback(response)
        }
    }
}
