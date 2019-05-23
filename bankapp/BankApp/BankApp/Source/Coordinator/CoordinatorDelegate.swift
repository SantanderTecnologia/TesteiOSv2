//
//  CoordinatorDelegate.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate: AnyObject {
    var rootViewController: UIViewController? { get set }
    var navigation: UINavigationController { get set }
    func start()
    
    init(nav: UINavigationController, root: UIViewController?)
}
