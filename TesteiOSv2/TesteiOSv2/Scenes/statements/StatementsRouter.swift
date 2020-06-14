//
//  StatementsRouter.swift
//  TesteiOSv2
//
//  Created by Foliveira on 13/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import UIKit

class StatementsRouter{
    static func navigateToLogin(controller: UIViewController) {
        let loginVC = LoginViewController()
        
        controller.navigationController?.pushViewController(loginVC, animated: true)
    }
}



