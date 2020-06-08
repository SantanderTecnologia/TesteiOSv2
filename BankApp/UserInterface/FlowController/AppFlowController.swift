//
//  AppFlowController.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Domain
import Presenter

public protocol FlowControllerDelegate {
    func start()
}

public class AppFlowController {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let factory: AppFactory
    
    // MARK: - INITIALIZERS
    
    public init(navigationController: UINavigationController, factory: AppFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - PUBLIC API
    
    public let navigationController: UINavigationController
}

extension AppFlowController: FlowControllerDelegate {
    
    public func start() {
        let loginViewController = factory.makeLoginViewController()
        loginViewController.delegate = self
        
        navigationController.pushViewController(loginViewController, animated: false)
    }
}

extension AppFlowController: AppFlowControllerDelegate {
    
    public func presentBalanceViewController(userAccount: UserAccountModel) {
        let balanceViewController = factory.makeBalanceViewController(userAccount: userAccount)
        balanceViewController.modalPresentationStyle = .fullScreen
        
        navigationController.present(balanceViewController, animated: false)
    }
}
