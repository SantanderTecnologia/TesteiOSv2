//
//  StatementsRequester.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementRequester {
    
    static func getAll(userId: Int, completion: @escaping (StatementsResponseStruct) -> Void, fail: @escaping (String) -> Void) {
        
        let endpoint = "/statements/\(userId)"
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        
        
        APIRequester.request(nil, method: .get, on: endpoint, headers: headers) { response in
            switch response.result {
                case .success:
                    guard
                        let data = response.data,
                        let object = try? JSONDecoder().decode(StatementsResponseStruct.self, from: data)
                        else { fail("Decode Error"); return }
                    
                    completion(object)
                case .failure(let error):
                    switch error {
                        case .responseStatusCode(let statusCode):
                            fail("Falha ao buscar statements.\nErro \(statusCode)")
                        default:
                            fail("Falha de comunicação com o servidor")
                    }
            }
        }
    }
}
