//
//  StatementsRepository.swift
//  TesteiOSv2
//
//  Created by Foliveira on 12/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol StatementsRepositoryProtocol: class {
    func requestStatementsData(userId: String, callback: @escaping (StatementResponse?) -> Void)
}

class StatementsRepository: StatementsRepositoryProtocol {
    func  requestStatementsData(userId: String, callback: @escaping (StatementResponse?) -> Void) {
        
        guard let url = URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(userId)") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            if let data = data {
                do {
                    
                    let jsonData = try JSONDecoder().decode(StatementResponse.self, from: data)
                    callback(jsonData)
                    
                } catch {
                    
                    print(error)
                    
                }
            }
        }.resume()
    }
}

