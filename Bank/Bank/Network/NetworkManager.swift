//
//  NetworkManager.swift
//  Bank
//
//  Created by Junior Obici on 14/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getUser(user: String, pass: String, parameters: [String: String], completionHandler: @escaping ([User]) -> Void ) {
        let parameters = [
            "user": user,
            "password": pass
        ]
        
        let arrayUser = [User]()
        
        Alamofire.request(baseURLUser, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response:DataResponse<Any>) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let userDecoded = try decoder.decode(LoginResponse.self, from: data)
                    
                    completionHandler([userDecoded.user])
                } catch let error {
                    print(error)
                    completionHandler(arrayUser)
                    debugPrint(response.result.error as Any)
                }
                
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getTransactions(withUserId userId: String, completionHandler: @escaping ([Transaction]) -> Void ) {
        let url = URL(string: baseURLTransaction + "/" + userId)!
        let arrayTransaction = [Transaction]()

        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response:DataResponse<Any>) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let transactionDecoded = try decoder.decode(TransactionResponse.self, from: data)
                    
                    completionHandler(transactionDecoded.statementList)
                } catch let error {
                    print(error)
                    completionHandler(arrayTransaction)
                    debugPrint(response.result.error as Any)
                }
                
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }
}
