//
//  Network.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation
import Alamofire


public typealias Failure = (_: NSError) -> Void

class Network<T:Codable> {
    typealias Success = (_: T) -> Void
    
    class func execute(request: Requestable,
                       success: @escaping Success,
                       failure: @escaping Failure) {
        
        guard let status = NetworkReachabilityManager.init(),
            status.isReachable else {
                failure(NSError.noInternetError)
                return
        }
        
        let request = Alamofire.request(
            request.url,
            method: request.method,
            parameters: request.parameters,
            encoding: request.encoding,
            headers: request.headers)
        
        request.responseJSON(queue: DispatchQueue.global(qos: .userInitiated), options: .mutableContainers) { dataResponse in
            guard let data = dataResponse.data,
                let response = dataResponse.response else {
                    failure(NSError.generalError)
                    return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    success(try JSONDecoder().decode(T.self, from: data))
                } catch {
                    failure(NSError.generalError)
                }
            //others cases 300, 400, 500...
            default:
                failure(NSError.generalError)
            }
        }
    }
}

