//
//  AccountDetailsWorker.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

class AccountDetailsWorker {
    
    enum StatementsResponse {
        case success([Statement])
        case error(Error)
        case nonSpecifiedError
    }
    
    func fetchStatements(request: AccountDetails.FetchStatements.Request,
                         completion: @escaping (StatementsResponse) -> Void) {
        
        APIProvider.shared.request(body: "",
                                   method: .get,
                                   endPoint: .statements(request.userId)) { (response: APIResponse) in
            
            switch response {
            case.sucess(let data):
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any] else {
                        completion(.nonSpecifiedError)
                        return
                    }
                    
                    let statementsJSON = try JSONSerialization
                        .data(withJSONObject: json, options: [])
                    
                    let statementsResponse = try JSONDecoder().decode(AccountDetails.FetchStatements.Response.self,
                                                                      from: statementsJSON)

                    completion(.success(statementsResponse.statementList))
                } catch let error {
                    completion(.error(error))
                }
                break
            case .error(let error):
                completion(.error(error))
                break
            default:
                completion(.nonSpecifiedError)
            }
        }
    }
    
}
