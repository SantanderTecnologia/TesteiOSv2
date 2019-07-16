//
//  HomeProtocolo.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

protocol HomePresenterInput {
    func viewDidLoad()
    func shoudLogout()
    func retry()
}


protocol HomePresenterOutput: class {
    func fetched(sections: [Section])
    func startLoading()
    func stopLoading()
    func showAlert(with message: String)
}

protocol HomeInteractorInput {
    func fetch(userID: Int)
}

protocol HomeInteractorOutput: class {
    func fecthed(items: [StatementItem])
    func fetchError(message: String)
    
}

protocol HomeManagerOutput: class {
    func fecthed(entity: [StatementEntity])
    func error(with error: Error)
}
