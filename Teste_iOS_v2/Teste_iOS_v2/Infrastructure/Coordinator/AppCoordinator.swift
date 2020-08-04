//
//  AppCoordinator.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var window: UIWindow
    var childCoordinators = [CoordinatorProtocol]()
    
    init(window: UIWindow) {
        self.navigationController = .init()
        self.window = window
    }
    
    func start() {
        initiateLoginFlow(isOnLaunch: true)
    }
    
    internal func initiateLoginFlow(isOnLaunch: Bool) {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.appCoordinatorDelegate = self
        coordinator.start()
        changeRootViewController(navigationController, isOnLaunch: isOnLaunch)
    }
    
    internal func initiateTimelineFlow(with userInformations: UserAccount?, needToSetAsRoot: Bool) {
        let coordinator = TimelineCoordinator(navigationController: navigationController, userInformations: userInformations, needToSetAsRoot: needToSetAsRoot)
        childCoordinators.append(coordinator)
        coordinator.appCoordinatorDelegate = self
        coordinator.start()
        if needToSetAsRoot {
            changeRootViewController(coordinator.navigationController, isOnLaunch: false)
        }
    }
    
    private func changeRootViewController(_ viewController: UIViewController, isOnLaunch: Bool) {
        guard let snapshot = window.snapshotView(afterScreenUpdates: true) else { return }
        window.rootViewController = viewController
        if isOnLaunch {
            window.makeKeyAndVisible()
            return
        }
        viewController.view.addSubview(snapshot)
        
        UIView.animate(withDuration: 0.3, animations: {
            snapshot.layer.opacity = 0
        }, completion:  { _ in
            snapshot.removeFromSuperview()
        })
    }
    
    internal func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        for (index, child) in childCoordinators.enumerated() where child === childCoordinator {
            childCoordinators.remove(at: index)
        }
    }
    
}
