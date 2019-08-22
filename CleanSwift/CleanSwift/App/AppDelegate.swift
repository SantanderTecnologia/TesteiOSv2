//
//  AppDelegate.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splashRouter: SplashRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        keyboardConfig()

        window = UIWindow(frame: UIScreen.main.bounds)
        splashRouter = SplashRouter(window: self.window)
        splashRouter?.start()
        return true
    }
    
    private func keyboardConfig() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .Default
    }
}

