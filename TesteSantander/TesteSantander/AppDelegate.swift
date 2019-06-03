//
//  AppDelegate.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.hero.isEnabled = true
        navigationController.hero.navigationAnimationType = .fade
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        navigationController.pushViewController(getInitialViewController(), animated: true)
        
        return true
    }
    
    fileprivate func getInitialViewController() -> UIViewController {
        return SplashViewController()
    }
    
}
