//
//  HomeManager.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class HomeManager: NSObject {
    
    weak var output: HomeManagerOutput?
    
    var baseUrl = "https://bank-app-test.herokuapp.com/api/statements/"
    
    func fetch(IdUser: Int) {
        baseUrl = "\(baseUrl)\(IdUser)"
        Alamofire.request(baseUrl).responseJSON { response in
            switch response.result {
            case .success:
                guard let listModel = Mapper<StatementListModel>().map(JSONObject:response.result.value) else { return }
                self.output?.fecthed(entity: listModel.statementList.map({ StatementEntity.make(model: $0)}))
            case .failure(let error):
               self.output?.error(with: error)
            }
        }
    }
}
