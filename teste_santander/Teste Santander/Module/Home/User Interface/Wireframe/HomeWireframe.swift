//
//  HomeWireframe.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class HomeWireframe {
    var window: UIWindow?
    weak var homeViewController: HomeViewController?
    
    func makeScreen(window: UIWindow?) -> HomeViewController {
        self.window = window
        let viewController = HomeViewControllerBuilder.make(wireframe: self)
        homeViewController = viewController
        return viewController
    }
    
    func showLogin(){
     self.window?.rootViewController = LoginWireframe().makeScreen(window: window)
    }
}
