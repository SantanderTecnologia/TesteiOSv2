//
//  LoginRouter.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright (c) 2018 Virgilius Santos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
  func routeToDetails()
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginDataPassing
{
  weak var viewController: LoginViewController?
    
  var dataStore: LoginDataStore?

  // MARK: Navigation
  
    func navigateToDetails(source: LoginViewController, destination: DetailsViewViewController)
    {
        source.present(destination, animated: true, completion: nil)
    }

  // MARK: Passing data
  
    func passDataToDetails(source: LoginDataStore, destination: inout DetailDataStore)
    {
        destination.user = source.user
    }
}

extension LoginRouter: LoginRoutingLogic {
    
    // MARK: Routing

    func routeToDetails() {
        let details = Assembly.shared.detailVC!
        if let source = dataStore, var dest = details.router?.dataStore {
            passDataToDetails(source: source, destination: &(dest))
        }
        navigateToDetails(source: viewController!, destination: details)
    }
}
