//
//  AccountWorker.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 17/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import Alamofire

class AccountWorker {
    func fetchStatements(page: String = "1", completion: @escaping (Account.Response?) -> Void) {
        let url = SantanderAPI.shared.getStatementsUrl() + page
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data, let statements = try? JSONDecoder().decode(Account.Response.self, from: data) else {
                completion(nil)
                return
            }
            completion(statements)
        }
    }
}
