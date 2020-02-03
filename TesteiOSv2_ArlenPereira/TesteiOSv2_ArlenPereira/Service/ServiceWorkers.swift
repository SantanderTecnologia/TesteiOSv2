//
//  LoginWorkers.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceWorkers {
    
    var serviceStore: ServiceStoreProtocol
    init(serviceStore: ServiceStoreProtocol) {
        self.serviceStore = serviceStore
    }
    
    // MARK: - Login
    func loginRequest(username: String, password: String, completionHandler: @escaping (LoginAPIModel) -> Void) {
        serviceStore.loginRequest(username: username, password: password) { (loginModel: () throws -> LoginAPIModel) -> Void in
            do {
                let login = try loginModel()
                DispatchQueue.main.async {
                    completionHandler(login)
                }
            } catch {
                print("... Error Catch...")
            }
        }
    }

    func statementsRequest(userId: Int, completionHandler: @escaping (StatementsAPIModel) -> Void) {
        serviceStore.statementsRequest(userId: userId) { (statementsModel: () throws -> StatementsAPIModel) -> Void in
            do {
                let statement = try statementsModel()
                DispatchQueue.main.async {
                    completionHandler(statement)
                }
            } catch {
                print("... Error Catch...")
            }
        }
    }

}

protocol ServiceStoreProtocol {
    
    // MARK: - Login
    func loginRequest(username: String, password: String, completionHandler: @escaping (() throws -> LoginAPIModel) -> Void)
    
    // MARK: - Statements
    func statementsRequest(userId: Int, completionHandler: @escaping (() throws -> StatementsAPIModel) -> Void)
}
