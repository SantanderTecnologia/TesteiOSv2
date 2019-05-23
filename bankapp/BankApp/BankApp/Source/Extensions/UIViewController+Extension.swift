//
//  UIViewController+Extension.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadNib<T:UIViewController>(as type: T.Type) -> T {
        return T(nibName: "\(type.self)", bundle: nil)
    }
}
