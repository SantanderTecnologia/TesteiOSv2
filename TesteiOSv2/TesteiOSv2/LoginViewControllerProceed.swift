//
//  LoginViewControllerProceed.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

protocol LoginViewControllerProceed : class{
    func callALertController(alert: UIAlertController)
    func goToNextViewController()
}
