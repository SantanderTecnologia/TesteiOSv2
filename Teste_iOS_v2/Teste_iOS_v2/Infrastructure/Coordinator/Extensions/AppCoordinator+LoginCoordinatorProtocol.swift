//
//  AppCoordinator+LoginCoordinatorProtocol.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension AppCoordinator: LoginCoordinatorProtocol {
    func didFinished(_ childCoordinator: CoordinatorProtocol, userInformations: UserAccount?) {
        removeChildCoordinator(childCoordinator)
        initiateTimelineFlow(with: userInformations, needToSetAsRoot: true)
    }
}
