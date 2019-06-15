//
//  UserLoginAlamofireGateway.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation
import Alamofire

final class UserLoginAlamofireGateway : UserLoginGateway{
   
    func authLogin(user: String, password: String, completion: @escaping (UserAccount) -> ()) {
        let target = UserLoginTarget.login(login: user, password: password)
        Alamofire.request(target.Url, method: target.method, parameters: target.parameters, encoding: JSONEncoding.default, headers: target.headers).responseJSON { response in
            
            switch response.result{
                case .success:
                    do{
                        let decodable = JSONDecoder()
                        decodable.keyDecodingStrategy = .convertFromSnakeCase
                        guard let data = response.data else{return}
                        let user = try decodable.decode(UserLogin.self , from:data)
                        completion(user.userAccount)
                    } catch{
                        fatalError("data could not be decoded.")
                }
                case .failure:
                print("Alamofire JSON request error.")
            }
        }
    }
}
