//
//  ApiManager.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 11/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

protocol ApiManagerDelegate: class {
    func getLoginSerealization(completion: @escaping ([DataUser]?, ValidationError?) -> Void)
    func getStatementSerealization(completion: @escaping ([StatementUser]?, ValidationError?) -> Void)
}

class ApiManager: ApiManagerDelegate{
    
    func getLoginSerealization(completion: @escaping ([DataUser]?, ValidationError?) -> Void) {
        if let path = Bundle.main.path(forResource: "login", ofType: "json"){
            
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                do{
                    let result = try JSONDecoder().decode(Login.self, from: data)
                    completion(result.userAccount, nil)
                }
            }catch{
                let error = ValidationError(titleError: "Atenção", messageError: "Não foi possivel carregar a lista de Login.")
                completion(nil, error)
            }
        }
    }
    
    func getStatementSerealization(completion: @escaping ([StatementUser]?, ValidationError?) -> Void) {
        if let path = Bundle.main.path(forResource: "statements", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                do{
                    let result = try JSONDecoder().decode(Statement.self, from: data)
                    completion(result.statementUsers, nil)
                }
            }catch{
                let error = ValidationError(titleError: "Atenção", messageError: "Não foi possivel carregar a lista de despesas.")
                completion(nil, error)
            }
        }
    }
}



