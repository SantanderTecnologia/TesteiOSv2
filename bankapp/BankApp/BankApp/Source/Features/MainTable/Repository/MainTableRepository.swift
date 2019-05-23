//
//  MainTableRepository.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

class MainTableRepository {
    
}

extension MainTableRepository: MainTableRepositoryDelegate {
    func fetch(id: Int, success: @escaping Network<[StatementModel]>.Success, failure: @escaping Failure) {
        Network<StatementWrapper>.execute(request: StatementRequest(id: id),
                                          success: { statementWrapper in
            success(statementWrapper.statementList)
        }, failure: failure)
    }
}
