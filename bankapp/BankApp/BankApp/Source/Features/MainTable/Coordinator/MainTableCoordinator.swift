//
//  MainTableCoordinator.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class MainTableCoordinator {
    var rootViewController: UIViewController?
    var navigation: UINavigationController
    
    required init(nav: UINavigationController, root: UIViewController?) {
        self.navigation = nav
        self.rootViewController = root
    }
}

extension MainTableCoordinator: MainTableCoordinatorDelegate {
    func start() {
        let viewController = UIViewController.loadNib(as: MainTableViewController.self)
        let presenter =  MainTablePresenter(coordinator: self, repository: MainTableRepository())
        viewController.presenter = presenter
        navigation.pushViewController(viewController, animated: false)
    }
    
    func logout() {
        AppDelegate.instance?.appCoordinator?.update(to: .login)
    }
}
