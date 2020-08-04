//
//  AppCoordinator+TimelineCoordinatorProtocol.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension AppCoordinator: TimelineCoordinatorProtocol {
    func didFinished(_ childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        initiateLoginFlow(isOnLaunch: false)
    }
}
