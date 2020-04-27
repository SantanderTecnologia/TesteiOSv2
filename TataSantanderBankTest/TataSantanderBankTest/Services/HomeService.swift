//
//  HomeService.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation
import Alamofire

class HomeService: HomeStoreProtocol {
    func getStatementsByUserId(_ userId: Int, completionHandler: @escaping (HomeResponse) -> ()) {
        if let path = API.getURL(.statements, ["id": userId]) {
            Alamofire.request(path, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData(completionHandler: { response in
                if let value = response.result.value {
                    let response = try! JSONDecoder().decode(HomeResponse.self, from: value)
                    completionHandler(response)
                }
            })
        }
    }
}
