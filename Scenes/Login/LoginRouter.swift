//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 26/02/19.
//  Copyright (c) 2019 Accenture do Brasil Ltda. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToShowStatement(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  
  // MARK: Routing
    func routeToShowStatement(segue: UIStoryboardSegue?){
      if let segue = segue {
        let destinationVC = segue.destination as! ExtratoViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToShowStatement(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ExtratoViewController") as! ExtratoViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToShowStatement(source: dataStore!, destination: &destinationDS)
        navigateToShowStatement(source: viewController!, destination: destinationVC)
      }
    }

  // MARK: Navigation
  
  func navigateToShowStatement(source: LoginViewController, destination: ExtratoViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToShowStatement(source: LoginDataStore, destination: inout ExtratoDataStore)
  {
    destination.userAccount = source.userAccount
  }
}
