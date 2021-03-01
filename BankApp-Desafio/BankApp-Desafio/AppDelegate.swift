//
//  AppDelegate.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initalViewController = LoginViewController(nibName: nil, bundle: nil)
        self.window?.rootViewController = initalViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

