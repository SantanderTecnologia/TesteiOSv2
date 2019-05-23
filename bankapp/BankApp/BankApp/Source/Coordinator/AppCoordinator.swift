//
//  AppCoordinator.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate: AnyObject {
    func start()
    func update(to flow: AppCoordinator.FlowType)
}

class AppCoordinator {
    enum FlowType {
        case login, main
    }
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private func coordinator(for flow: FlowType) {
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true
        
        let coordinator: CoordinatorDelegate
        
        switch flow {
        case .login:
            coordinator = LoginCoordinator(nav: navigation, root: nil)
        case .main:
            coordinator = MainTableCoordinator(nav: navigation, root: nil)
        }
        
        coordinator.start()
        transition(to: coordinator.navigation)
        window.makeKeyAndVisible()
    }
    
    private func transition(to viewController: UIViewController) {
        guard let rootViewController = window.rootViewController else {
            window.rootViewController = viewController
            return
        }
        
        UIView.transition(from: rootViewController.view, to: viewController.view, duration: 0.3, options: .transitionFlipFromRight) { (finished) in
            self.window.rootViewController = viewController
        }
    }
}

extension AppCoordinator: AppCoordinatorDelegate {
    func start() {
        coordinator(for: .login)
    }
    
    func update(to flow: AppCoordinator.FlowType) {
        coordinator(for: flow)
    }
}
