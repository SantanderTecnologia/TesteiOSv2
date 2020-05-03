//
//  Provider.swift
//  SANTANDER
//
//  Created by Maíra Preto on 29/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import Alamofire

class StatementsProvider {
    
    func getDataFromHeroKu(completion: @escaping ([StatementList]?) -> Void) {
        
        let url = API.baseURL + API.statement
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(ApiResponse.self, from: data)
                    completion(result.statementList)
                }catch {
                    completion(nil)
                }
            }else {
                completion(nil)
                return
            }
        }
        
    }
    
    
}




