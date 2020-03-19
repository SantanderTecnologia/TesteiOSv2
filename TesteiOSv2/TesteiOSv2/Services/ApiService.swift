//
//  ApiService.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 10/03/20.
//  Copyright © 2020 Mônica Marques. All rights reserved.
//

import Foundation
import Alamofire

class APIService: NSObject {
    func setupAPIHeader() -> HTTPHeaders {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
    
    func APIRequest(urlString: String, method: HTTPMethod, parameters: Parameters? = nil, completion: @escaping (AFDataResponse<Data>) -> Void ) {
        
        AF.request(urlString, method: method, parameters: parameters, headers: self.setupAPIHeader()).responseData { response in
            
            completion(response)
        }
    }
}
