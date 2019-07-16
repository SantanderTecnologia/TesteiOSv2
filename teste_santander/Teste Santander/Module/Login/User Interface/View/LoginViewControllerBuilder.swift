//
//  LoginViewControllerBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "Login"
    
    func makeScreen(wireframe: LoginWireframe) -> LoginViewController {
        let presenter = LoginPresenterBuilder.make(wireframe: wireframe)
         let viewController = viewControllerFromStoryboard(withIdentifier: "LoginViewController") as! LoginViewController
        viewController.presenter = presenter
        presenter.output = viewController
        return viewController
    }
    
}
