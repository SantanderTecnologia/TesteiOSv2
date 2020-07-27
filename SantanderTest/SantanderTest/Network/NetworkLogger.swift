//
//  NetworkLogger.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

class NetworkLogger {
    static func log(request: URLRequest) {
        #if DEBUG
            print("\n - - - - - - - - - - REQUEST - - - - - - - - - - \n")
            defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        #endif

        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
        Method: \(method) \n
        Url: \(urlAsString) \n
        Path: \(path)?\(query) HTTP/1.1 \n
        HOST: \(host)\n\n
        Headers:
        """
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        #if DEBUG
            print(logOutput)
        #endif
    }
    
    static func log(response: URLResponse?, data: Data?) {
        #if DEBUG
            print("\n - - - - - - - - - - RESPONSE - - - - - - - - - - \n")
            defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        #endif
        
        guard let response = response as? HTTPURLResponse else {
            return
        }
        
        let urlAsString = response.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        
        let statusCode = "\(response.statusCode)"
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
        Status code: \(statusCode) \n
        Url: \(urlAsString) \n
        Path: \(path)?\(query) HTTP/1.1 \n
        HOST: \(host)\n\n
        Data:
        """
        
        if let responseData = data,
            let jsonDictionary = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
            logOutput += "\(jsonDictionary)"
        }
        
        #if DEBUG
            print(logOutput)
        #endif
    }
}
