//
//  DispatchWireframe.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class DispatchWireframe {
    
    var window: UIWindow?
    
    func makeScreen(window: UIWindow?) -> DispatchViewController {
        let viewController = DispatchViewControllerBuilder().makeScreen(wireframe: self)
        self.window = window
        return viewController
    }
    
    
    func showLogin(){
        self.window?.rootViewController = LoginWireframe().makeScreen(window: window)
    }
    
    func showDetail(){
        self.window?.rootViewController = HomeWireframe().makeScreen(window: window)
    }
}
