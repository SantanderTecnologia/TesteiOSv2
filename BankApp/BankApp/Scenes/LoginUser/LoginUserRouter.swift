//
//  LoginUserRouter.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import UIKit

@objc protocol LoginUserRoutingLogic {
    func routeToStatement(segue: UIStoryboardSegue?)
}

protocol LoginUserDataPassing {
    var dataStore: LoginUserDataStore? { get }
}

class LoginUserRouter: NSObject, LoginUserRoutingLogic, LoginUserDataPassing {
    
    weak var viewController: LoginUserViewController?
    var dataStore: LoginUserDataStore?
    
    
    // MARK: LoginUserRoutingLogic
    
    func routeToStatement(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! StatementUserViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToShowUser(source: dataStore!, destination: &destinationDS)
        }
    }
    
    func passDataToShowUser(source: LoginUserDataStore, destination: inout StatementUserDataStore) {
        destination.user = source.user
    }
}
