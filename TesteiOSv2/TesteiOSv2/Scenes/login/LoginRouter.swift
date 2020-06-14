//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Foliveira on 13/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter{
    static func navigateToStatements(controller: UIViewController, data: UserInfo?) {
        let statementsController = StatementsViewController()
        statementsController.userAccount = data!
        
        controller.navigationController?.pushViewController(statementsController, animated: true)
        
    }
}

