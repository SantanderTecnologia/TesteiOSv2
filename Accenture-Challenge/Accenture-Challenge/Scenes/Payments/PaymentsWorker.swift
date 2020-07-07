//
//  PaymentsWorker.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

protocol PaymentsWorkerProtocol {
    func fetchStatements(_ request: Payments.Request.Statements, completion: @escaping StatementsCallback)
}

enum PaymentsResponse {
    case success([Payments.Response.Statements])
    case error(Error)
    case genericError
}

class PaymentsWorker: PaymentsWorkerProtocol {
    
    func fetchStatements(_ request: Payments.Request.Statements, completion: @escaping StatementsCallback) {
        let httpMethod = HttpMethod.get
        let endpoint = EndPoint.statements(request.userId)
        let body = String.empty
        
        APIProvider.shared.request(body: body, httpMethod: httpMethod, endpoint: endpoint) { response in
            switch response {
            case .sucess(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                        if let statements = json["statementList"] as? [[String : Any]] {
                            let statement = try JSONSerialization.data(withJSONObject: statements, options: [])
                            let statementsResponse = try JSONDecoder().decode([Payments.Response.Statements].self, from: statement)
                            completion(.success(statementsResponse))
                        }
                    }
                } catch {
                    completion(.genericError)
                }
                break
            case .errorToFetchData:
                completion(.genericError)
                break
            case .clientError(let error):
                completion(.error(error))
                break
            case .urlNotFound:
                completion(.genericError)
            }
        }
    }
}
