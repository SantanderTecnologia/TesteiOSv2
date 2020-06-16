//
//  BankAPI.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import Foundation

class BankAPI: BankUserStoreProtocol, BankStatementsStoreProtocol{
    let baseURL = "https://bank-app-test.herokuapp.com/api"
    let routeLogin = "/login"
    let routeStatements = "/statements/"
    
    var currentTask: URLSessionDataTask?
    
    func fetchUserAccount(userCredentials: UserCredentials,
                          completionHandler: @escaping (Login.FetchUser.Response?, LoginError?) -> Void) {
        guard let url = URL(string: baseURL + routeLogin) else { return }
        currentTask?.cancel()
        var request = URLRequest(url: url)
        let bodyData = "user=\(userCredentials.emailOrCPF)&password=\(userCredentials.password)".data(using: .utf8)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        currentTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error{
                    completionHandler(nil, LoginError.CannotLogin(error.localizedDescription))
                }else if let data = data{
                    do{
                        let response = try JSONDecoder().decode(Login.FetchUser.Response.self,
                                                                from: data)
                        completionHandler(response, nil)
                    }catch{
                        print(error)
                        completionHandler(nil, LoginError.CannotLogin("Error decoding response from api."))
                    }
                }else{
                    completionHandler(nil, LoginError.CannotLogin("There was an unknown error!"))
                }
            }
        }
        currentTask?.resume()
    }
    
    func fetchStatements(userAccount: UserAccount,
                         completionHandler: @escaping (UserBalance.FetchStatements.Response?, UserBalanceError?) -> Void){
        guard let url = URL(string: baseURL + routeStatements + "\(userAccount.userId ?? 0)") else { return }
        currentTask?.cancel()
        currentTask = URLSession.shared.dataTask(with: url) {data, _, error in
            DispatchQueue.main.async {
                if let error = error{
                    completionHandler(nil, UserBalanceError.CannotGetStatements(error.localizedDescription))
                }else if let data = data{
                    do{
                        let response = try JSONDecoder().decode(UserBalance.FetchStatements.Response.self,
                                                                from: data)
                        completionHandler(response, nil)
                    }catch{
                        print(error)
                        completionHandler(nil, UserBalanceError.CannotGetStatements("Error decoding response from api."))
                    }
                }else{
                    completionHandler(nil, UserBalanceError.CannotGetStatements("There was an unknown error"))
                }
            }
        }
        currentTask?.resume()
    }
}
