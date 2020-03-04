//
//  AccountRouter.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

protocol AccountRoutingLogic: class {

    func routeTologout()
}

class AccountRouter: AccountRoutingLogic {
    weak var viewController: AccountViewController?

    func routeTologout() {
        let controller = LoginViewController()
          controller.modalPresentationStyle = .fullScreen
          controller.modalTransitionStyle = .flipHorizontal
          viewController?.present(controller, animated: true, completion: nil)
    }
}
