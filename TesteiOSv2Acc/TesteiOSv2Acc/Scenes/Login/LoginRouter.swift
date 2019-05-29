//
//  LoginRouter.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToStatements(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: - Routing
    
    func routeToStatements(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! StatementsViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToStatements(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Statements", bundle: nil)
        let destinationVC = storyboard.instantiateInitialViewController() as! StatementsViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToStatements(source: dataStore!, destination: &destinationDS)
        navigateToStatements(source: viewController!, destination: destinationVC)
      }
    }
    
    // MARK: - Navigation
    
    func navigateToStatements(source: LoginViewController, destination: StatementsViewController)
    {
      source.show(destination, sender: nil)
    }
    
    // MARK: - Passing data
    
    func passDataToStatements(source: LoginDataStore, destination: inout StatementsDataStore)
    {
      destination.userAccount = source.userAccount
    }
    
}
