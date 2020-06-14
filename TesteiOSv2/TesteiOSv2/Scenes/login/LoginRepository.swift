//
//  LoginRepository.swift
//  TesteiOSv2
//
//  Created by Foliveira on 04/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol LoginRepositoryProtocol: class {
    func requestLoginData(data: UserAuthModel, callback: @escaping (UserResponseModel?) -> Void)
}

class LoginRepository: LoginRepositoryProtocol {
    func  requestLoginData(data: UserAuthModel, callback: @escaping (UserResponseModel?) -> Void) {
        
        guard let url = URL(string: "https://bank-app-test.herokuapp.com/api/login") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = getBody(data: data)
        
        URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            if let data = data {
                do {
                    
                    let jsonData = try JSONDecoder().decode(UserResponseModel.self, from: data)
                    callback(jsonData)
                    
                } catch {
                    
                    print(error)
                    
                }
            }
        }.resume()
    }
    
    
    
    private func getBody(data: UserAuthModel) -> Data? {
        
        let bodyData = ["user": data.name, "password": data.password]
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: bodyData)
            return jsonData
            
        } catch {
            
            return Data()
            
        }
    }
}
