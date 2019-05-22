//
//  StatementsWorker.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

class StatementsWorker {
    func doSomeWork() {}
    
    func fetch(completion: @escaping(_ response: StatementsResponse?, _ errorMessage: String?) -> Void){
        let request = StatementsRequest()
        Remote.makeRequest(request: request, completionHandler: completion)
    }
}
