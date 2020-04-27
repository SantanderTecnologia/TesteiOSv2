//
//  HomeServiceMock.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 27/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation

class HomeServiceMock: HomeStoreProtocol {
    var response: HomeResponse = {
       var statementList: [Statement] = []
        for i in 0...4 {
            statementList.append(Statement(title: "TED \(i)", desc: "Pagamento \(i)", date: "2019-6-\(i)", value: Float(i)))
        }
        return HomeResponse(statementList: statementList, error: Error())
    }()
    
    let correctId = 1
    
    func getStatementsByUserId(_ userId: Int, completionHandler: @escaping (HomeResponse) -> ()) {
        if(userId == correctId) {
            completionHandler(response)
        } else {
            response.statementList = []
            response.error = Error(message: "User not exists", code: 500)
            completionHandler(response)
        }
    }
}
