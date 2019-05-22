//
//  LoginRouter.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
  
    // MARK: Routing
  
    func routeToSomewhere(segue: UIStoryboardSegue?) {
        let destinationVC = StatementsViewController(nibName: "Statements", bundle: Bundle.main)
        var destinationDS = destinationVC.router!.dataStore!
        
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)

    }
    
    func navigateToSomewhere(source: LoginViewController, destination: StatementsViewController) {
        source.show(destination, sender: nil)
    }
    
    func passDataToSomewhere(source: LoginDataStore, destination: inout StatementsDataStore) {
        destination.userInfo = source.userInfo
    }

}
