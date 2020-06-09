//
//  BaseBankApi.swift
//  Williamberg Bank
//
//  Created by padrao on 23/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import Foundation

struct BaseBankAPI{
    
    enum HttpMethod: String{
        case POST = "POST"
        case GET = "GET"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    enum ServiceError: LocalizedError{
        case NullResponse
        
        var errorDescription: String?{
            switch self {
            case .NullResponse:
                return NSLocalizedString("Resposta nula recebida do servidor.", comment: "Service Error")
            }
        }
    }
    
    let baseUrl = "https://bank-app-test.herokuapp.com/api/"
    
    func makeRequest(serviceName: String, args: [String: Any]?, httpMethod: HttpMethod, completionHandler: @escaping (_ data: Data?, _ urlResponse: URLResponse?, _ error: Error?) -> Void){
        
        guard let url = URL(string: baseUrl + serviceName) else{
            completionHandler(nil, nil, URLError(URLError.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        if let dictArgs = args{
                let dictArray = dictArgs.compactMap({ "\($0)=\($1)" })
                urlRequest.httpBody = dictArray.joined(separator: "&").data(using: .utf8)
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            completionHandler(data, response, error)
        }
        dataTask.resume()
    }
    
}
