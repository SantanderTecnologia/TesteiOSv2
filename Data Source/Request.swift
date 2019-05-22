//
//  Request.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 08/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation


@objc public enum HTTPMethod: Int {
    case get, post
    func asString() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

@objc public protocol Request {
    var method: HTTPMethod { get }
    var endpoint: String { get }
    @objc optional var body: Any { get }
    @objc optional var headers: [String : String] { get }
}

extension Request {
    
    func asURLRequest() -> URLRequest? {
        // creates URL and guarantees that it isn't nil
        guard let url = URL(string: self.endpoint) else {
            return nil
        }
        
        // create request from URL and set properties
        var urlRequest = URLRequest(url: url)
        
        // run through header dictionary
        if let headers = self.headers, headers.count  > 0 {
            for header in headers {
                urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = self.method.asString()
        
        // create the body, if has any
        if self.body != nil {
            let jsonData: Data
            
            do {
                jsonData = try JSONSerialization.data(withJSONObject: self.body!, options: [])
                urlRequest.httpBody = jsonData
            } catch {
                return nil
            }
        }
        
        return urlRequest
    }
}
