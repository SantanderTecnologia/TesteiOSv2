//
//  SplashRouter.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright (c) 2019 Sam. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SplashRoutingLogic {
    func routeToSomewhere(controller: SplashViewController, user: UserRealm?)
}

class SplashRouter: NSObject, SplashRoutingLogic {
    
    var rootViewController: UIViewController { return navigationController }
    
    //This is navigation controller and where will be import
    //the navigationController's custom.
    private lazy var navigationController: UINavigationController = {
        let navigationController = CSNavigationController(rootController: nil)
        return navigationController
    }()
    
    /// Window to manage
    let window: UIWindow?
    
    //The initialization of our window.
    public init(window: UIWindow?) {
        self.window = window
    }

    public func start() {
        self.window?.rootViewController = self.rootViewController
        self.window?.makeKeyAndVisible()
        
        let splash = SplashViewController(router: self, realmWorker: RealmWorker())
        rootViewController.present(splash, animated: false, completion: nil)
    }
  
    func routeToSomewhere(controller: SplashViewController, user: UserRealm?) {
        controller.dismiss(animated: false, completion: nil)
        
        let login = LoginViewController(interactor: LoginInteractor(worker: LoginWorker()), router: LoginRouter(), presenter: LoginPresenter())
        navigationController.present(login, animated: false, completion: nil)
    }

}
