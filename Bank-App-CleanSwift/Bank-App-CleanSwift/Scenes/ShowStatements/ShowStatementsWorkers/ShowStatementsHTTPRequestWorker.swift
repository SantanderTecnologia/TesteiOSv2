//
//  ShowStatementsHTTPRequestWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation
import Alamofire


/// Worker class for GET http request.
class ShowStatementsHTTPRequestWorker {
    
    /// Get all `statements` of a given `user` based on `userId`, executing `completion` after.
    /// - Parameters:
    ///   - userId: the `id` of an `user`
    ///   - completion: the code to be executed when doing the request properly.
    func fetchStatements(ofUser userId: Int, completion: @escaping (StatementListData) -> ()) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        let request = AF.request(endpoint)
        
        request.responseDecodable(of: StatementListData.self) { response in            
            guard let value = response.value else { return }
            
            completion(value)
        }
    }
}

    
