//
//  NetworkManeger.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 07/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let shared = NetworkManager()
    
    //user: String, pass: String
    func loginUser(user: String, pass: String, completionHandler: @escaping ([UserAccountDate]) -> Void ) {
        
        let parameters = [
            "user": user,
            "password": pass
        ]
        
        let arrayUserAccounts = [UserAccountDate]()
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: parameters, encoding:  URLEncoding.httpBody).responseJSON { (response:DataResponse<Any>) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedUserAcconts = try decoder.decode(UserAccount.self, from: data)
                    
                    completionHandler([decodedUserAcconts.userAccount])
                } catch let error {
                    print(error)
                    completionHandler(arrayUserAccounts)
                    debugPrint(response.result.error as Any)
                }
                
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func getStatements(withUserId userId:String, completionHandler: @escaping ([StatementList]) -> Void ) {
        Alamofire.request("\(URL_STATEMENTS)\(userId)", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response:DataResponse<Any>) in
            
            let arrayStatements = [StatementList]()
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedStatements = try decoder.decode(Statement.self, from: data)
                    
                    completionHandler(decodedStatements.statementList)
                } catch let error {
                    print(error)
                    completionHandler(arrayStatements)
                    debugPrint(response.result.error as Any)
                }
            } else {
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
}
