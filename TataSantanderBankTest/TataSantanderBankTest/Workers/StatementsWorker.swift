//
//  HomeWorker.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

class StatementsWorker {
    
    var homeStore: HomeStoreProtocol
    
    init(store: HomeStoreProtocol) {
        self.homeStore = store
    }
    
    func getStatementsByUserId(userId: Int, completion: @escaping (HomeResponse) -> ()) {
        self.homeStore.getStatementsByUserId(userId, completionHandler: completion)
    }
}

protocol HomeStoreProtocol {
    func getStatementsByUserId(_ userId:Int, completionHandler: @escaping (HomeResponse) -> ())
}
