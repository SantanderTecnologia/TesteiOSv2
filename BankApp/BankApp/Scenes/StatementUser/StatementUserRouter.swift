//
//  StatementUserRouter.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import UIKit

@objc protocol StatementUserRoutingLogic {
    func routeToLogin(segue: UIStoryboardSegue?)
}

protocol StatementUserDataPassing {
    var dataStore: StatementUserDataStore! {get set}
}

class StatementUserRouter: NSObject, StatementUserRoutingLogic, StatementUserDataPassing {
    
    var dataStore: StatementUserDataStore!
    weak var viewController: StatementUserViewController?
    
    // MARK: LoginUserRoutingLogic
    
    func routeToLogin(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! LoginUserViewController
            var destinationDS = destinationVC.router!.dataStore!
        }
    }
    
}
