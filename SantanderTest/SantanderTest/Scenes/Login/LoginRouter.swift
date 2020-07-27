//
//  LoginRouter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginRoutingLogic {
    func routeToDetail()
}

protocol LoginDataPassing {
    var dataSource: LoginDataSource? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {

    weak var viewController: LoginViewController?
    var dataSource: LoginDataSource?
    
    func routeToDetail() {
        let vc = AccountDetailViewController()
        guard let dataSource = dataSource, let destinationRouter = vc.router, var destinationDataSource = destinationRouter.dataStore else { return }
        passDataToDetails(source: dataSource, destination: &destinationDataSource)
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true, completion: nil)
    }

    private func passDataToDetails(source: LoginDataSource, destination: inout AccountDetailDataStore) {
        destination.user = source.user
    }
}
