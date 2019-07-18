//
//  requestDetails.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 14/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import Foundation
import Alamofire

    protocol DetailsService {
        func showDetails(userId: Int, completion:@escaping ([Transactions]) -> Void)
    }
    class requestDetails: DetailsService{
        func showDetails(userId: Int, completion: @escaping ([Transactions]) -> Void) {
            let statementEndpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
            
            AF.request(statementEndpoint, method: .get).responseData{ response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(StatementResponse.self, from: response.data!)
                completion(model.transactions)
                
            }
        }
}
