//
//  StatementsInteractor.swift
//  TesteiOSv2
//
//  Created by Foliveira on 12/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol StatementsInteractorProtocol {
    func fetchUserData(userId: String)
}

class StatementsInteractor: StatementsInteractorProtocol {
    
    var presenter: StatementsPresenterProtocol?
    var repository = StatementsRepository()
    
    func fetchUserData(userId: String) {
        repository.requestStatementsData(userId: userId){ (data) in
            if let statements = data?.statementList {
                self.presenter?.presentUserData(data: statements)
            }
        }
    }
}

