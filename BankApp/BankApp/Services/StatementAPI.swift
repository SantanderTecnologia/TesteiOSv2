//
//  StatementAPI.swift
//  BankApp
//
//  Created by Visão Grupo on 23/07/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Alamofire

class StatementAPI: StatementStoreProtocol {
    
    // MARK: StatementStoreProtocol
    
    func fetchStatements(_ id: Int, completionHandler: @escaping ([Statement]) -> Void) {
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/\(id)", method: .get, headers: ["Content-Type":"application/x-www-form-urlencoded"]).responseJSON { response in
            do {
//                print(response.request)
//                print(response.response)
//                print(response.data)
//                print(response.result)
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
                if let data = response.data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let statementsJson = json["statementList"] as? [[String: Any]] {
                            let statementsData = try JSONSerialization.data(withJSONObject: statementsJson, options: [])
                            let decoder = JSONDecoder()
                            let statements = try decoder.decode([Statement].self, from: statementsData)
                            completionHandler(statements)
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
