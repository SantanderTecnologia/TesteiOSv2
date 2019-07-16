//
//  HomeInteractor.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput?
    
    var manager: HomeManager
    
    init(manager: HomeManager) {
        self.manager = manager
    }
    
    func fetch(userID: Int) {
        manager.fetch(IdUser: userID)
    }
}

extension HomeInteractor: HomeManagerOutput {
    
    func error(with error: Error) {
        output?.fetchError(message: error.localizedDescription)
    }
    
    func fecthed(entity: [StatementEntity]) {
        output?.fecthed(items: entity.map({ StatementItem.make(entity: $0)}))
    }
}
