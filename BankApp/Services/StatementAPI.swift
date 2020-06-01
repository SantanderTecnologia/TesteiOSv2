//
//  StatementService.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StatementAPI: StatementStoreProtocol {
    
    func fetchStatement(completionHandler: @escaping ([Statement]) -> Void) {
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/1", method: .get)
            .responseJSON { response in
                if let data = response.data,
                    let json = try? JSON(data: data),
                    !json["statementList"].isEmpty,
                    let statementJsonData = try? json["statementList"].rawData() {
                    let statements: [Statement] = self.parse(statementJsonData)
                    completionHandler(statements)
                } else {
                    completionHandler([])
                }
        }
    }
    
    private func parse<T:Decodable>(_ data: Data, as type:T.Type = T.self) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse JSON as \(T.self):\n\(error)")
        }
    }
    
}
