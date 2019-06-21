//
//  LoginRouter.swift
//  TesteSantander
//
//  Created by Hugo Abolis Jordao on 13/06/19.
//  Copyright (c) 2019 Hugo Abolis Jordao. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToExtractVC(segue: UIStoryboardSegue?)
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
    
    func routeToExtractVC(segue: UIStoryboardSegue?)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ExtractViewController") as! ExtractViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToExtractVC(source: dataStore!, destination: &destinationDS)
        navigateToExtractVC(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToExtractVC(source: LoginViewController, destination: ExtractViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToExtractVC(source: LoginDataStore, destination: inout ExtractDataStore)
    {
        destination.userData = source.userData
    }
}
