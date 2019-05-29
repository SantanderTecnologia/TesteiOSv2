//
//  RestService.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 24/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Alamofire

class RestService<T: Codable> {
    
    var currentRequest: DataRequest?
    
    func executeServiceRequest(serviceRequest: ServiceRequest, completion: @escaping (T?, Error?) -> Void){
        
        let url = serviceRequest.url
        let method = serviceRequest.method
        let parameters = serviceRequest.parameters
        let headers = serviceRequest.headers
        
        currentRequest = Alamofire.request(url, method: method, parameters: parameters, headers: headers)
        
        currentRequest?.responseJSON
            { (response) in
                
                switch response.result{
                case .success(_):
                    do{
                        if let data = response.data{
                            let result = try JSONDecoder().decode(T.self, from: data)
                            completion(result, nil)
                        }
                    }catch{
                        let error = NSError(domain: "JSON decode failed", code: 2, userInfo: nil)
                        completion(nil, error)
                    }
                    break;
                case .failure(let error):
                    completion(nil, error)
                    break;
                }
        }
        
    }
    
    func cancelCurrentRequest(){
        currentRequest?.cancel()
    }
    
}


