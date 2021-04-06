//
//  LoginWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation
import Alamofire

/// Worker class for POST http request.
class LoginHTTPRequestWorker {
    
    /// Make a `post` request with the parameters `user` and `password` presents inside `user` object, and executes the `completion`.
    /// - Parameter user: an `User` objects, containing an `username` and a `password`
    /// - Parameter completion: a `closure` that will be executed inside the request.
    
    func doLogin(with user: User, completion: @escaping (UserData) -> ()) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login/"
        let headers: HTTPHeaders = [.contentType("application/json; charset=utf-8")]
        
        let request = AF.request(endpoint,
                                 method: .post,
                                 parameters: UserParameters(user: user.username, password: user.password),
                                 encoder: JSONParameterEncoder.default,
                                 headers: headers)
        request.responseDecodable(of: UserData.self) { response in
            completion(response.value!)
        }
    }
}
