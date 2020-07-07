//
//  SceneDelegate.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
                   let window = UIWindow(windowScene: windowScene)
                   window.makeKeyAndVisible()
                   self.window = window
                   let loginVC = LoginViewController()
                   window.rootViewController = UINavigationController(rootViewController: loginVC)
        }
    }
}

