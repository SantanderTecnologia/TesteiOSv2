//
//  TimelineCoordinator.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol TimelineCoordinatorProtocol: AnyObject {
    func didFinished(_ childCoordinator: CoordinatorProtocol)
}

class TimelineCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    let userInformations: UserAccount?
    var appCoordinatorDelegate: TimelineCoordinatorProtocol?
    
    init(navigationController: UINavigationController,
         userInformations: UserAccount?,
         needToSetAsRoot: Bool) {
        self.userInformations = userInformations
        if needToSetAsRoot {
            self.navigationController = .init()
            return
        }
        self.navigationController = navigationController
    }
    
    func start() {
        initiateTimeline()
    }
    
    private func initiateTimeline() {
        let controller = TimelineViewController()
        let presenter = TimelinePresenter(viewController: controller)
        let worker = TimelineWorker()
        let interactor = TimelineInteractor(presenter: presenter, worker: worker, userInformations: userInformations)
        controller.interactor = interactor
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    internal func didFinishCoordinatorFlow() {
        appCoordinatorDelegate?.didFinished(self)
    }
    
    
}
