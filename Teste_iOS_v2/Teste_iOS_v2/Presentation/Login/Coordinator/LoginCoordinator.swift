//
//  LoginCoordinator.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    func didFinished(_ childCoordinator: CoordinatorProtocol, userInformations: UserAccount?)
}

class LoginCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var appCoordinatorDelegate: LoginCoordinatorProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        initiateLogin()
    }
    
    private func initiateLogin() {
        let controller = LoginViewController()
        let presenter = LoginPresenter(viewController: controller)
        let worker = LoginWorker()
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        controller.interactor = interactor
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    internal func showError(controller: UIViewController) {
        navigationController.present(controller, animated: true, completion: nil)
    }
    
    internal func didFinishLoginFlow(model: LoginModels.Response) {
        appCoordinatorDelegate?.didFinished(self, userInformations: model.response.userAccount)
    }
}
