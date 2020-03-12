//
//  StatementAPI.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//
import Foundation
import Alamofire

class StatementAPI: StatementStoreProtocol {
    
    func fetchStatements(_ userId: Int, completionHandler: @escaping (StatementResponse) -> ()) {
        Alamofire
            .request(Endpoints.Statements.getStatements(userId).url, method: .get, encoding: JSONEncoding.default)
            .responseData(completionHandler: { response in
                if let value = response.result.value {
                    let response = try! JSONDecoder().decode(StatementResponse.self, from: value)
                    completionHandler(response)
                }
        })
    }
    
}
