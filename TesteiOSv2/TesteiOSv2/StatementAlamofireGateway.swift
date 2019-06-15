//
//  StatementAlamofireGateway.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation
import Alamofire

class StatementAlamofireGateway : StatementGateway{

    func fecthStatements(page: String, completion: @escaping (StatementList) -> ()) {
        let statementTarget = StatementTarget.list(page: page)
        
        Alamofire.request(statementTarget.Url, method: statementTarget.method, parameters: nil, encoding: JSONEncoding.default, headers: statementTarget.headers).responseJSON { response in
            switch response.result {
            case .success:
                do{
                    let decodable = JSONDecoder()
                    decodable.keyDecodingStrategy = .convertFromSnakeCase
                    guard let data = response.data else{return}
                    let statements = try decodable.decode(StatementList.self , from:data)
                    completion(statements)
                }catch let error{
                    print("data could not be decoded: \(error)")
                }
            case .failure(let error):
                print("Alamofire JSON request error.\(error)")
            }
        }
    }
    
    
}
