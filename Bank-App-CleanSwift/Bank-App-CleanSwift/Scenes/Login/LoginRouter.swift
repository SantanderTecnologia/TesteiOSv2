//
//  LoginRouter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol ShowUserDataPassing {
    var dataStore: UserAccountDataStore? { get }
}

protocol LoginRoutingLogic {
    func routeToStatementsView()
}


class LoginRouter: NSObject, ShowUserDataPassing, LoginRoutingLogic {
    var dataStore: UserAccountDataStore?
    var viewController: LoginViewController?
    
    
    /// Calls the `ShowStatements` screen, passing data properly
    func routeToStatementsView() {
        if let showStatementsViewController = viewController?.storyboard?.instantiateViewController(withIdentifier: Constants.SHOW_STATEMENTS_VC_ID) as? ShowStatementsViewController {
            var destinationDS = showStatementsViewController.router!.dataStore!
        
            passDataFromLoginToShowStatementsScreen(source: dataStore!, destination: &destinationDS)
            viewController?.navigationController?.pushViewController(showStatementsViewController, animated: true)
        }
    }
    
    
    ///  Performs passing data between `LoginViewController` and `ShowStatementViewController` `UserAccount` objects
    /// - Parameters:
    ///   - source: an `UserAccountDataStore` object
    ///   - destination:  a `ShowStatementsDataStore` object
    private func passDataFromLoginToShowStatementsScreen(source: UserAccountDataStore!, destination: inout ShowStatementsDataStore) {
        destination.userAccount = source.userAccount
    }
}
