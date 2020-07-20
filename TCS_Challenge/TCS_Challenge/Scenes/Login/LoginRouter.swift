//
//  LoginRouter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToAccountDetails(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
        
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToAccountDetails(segue: UIStoryboardSegue?) {
        DispatchQueue.main.async {
            let destinationVC = self.viewController?.storyboard?.instantiateViewController(identifier: "AccountDetailsViewController") as! AccountDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            self.passDataToAccountDetails(source: self.dataStore!,
                                     destination: &destinationDS)
            self.navigateToAccountDetails(source: self.viewController!, destination: destinationVC)
        }
    }

    // MARK: Navigation
    
    func navigateToAccountDetails(source: LoginViewController, destination: AccountDetailsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToAccountDetails(source: LoginDataStore, destination: inout AccountDetailsDataStore) {
        
        guard let userId = source.loginResponse?.userId,
            let name = source.loginResponse?.name,
            let bankAccount = source.loginResponse?.bankAccount,
            let agency = source.loginResponse?.agency,
            let balance = source.loginResponse?.balance else {
                return
        }
        
        destination.userAccount = AccountInfo(userId: userId,
                                              name: name,
                                              bankAccount: bankAccount,
                                              agency: agency,
                                              balance: balance)
    }
}
