//
//  AppDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
    var appCoordinator: AppCoordinatorDelegate?
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { fatalError() }
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
}

extension AppDelegate {
    static var instance: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}
