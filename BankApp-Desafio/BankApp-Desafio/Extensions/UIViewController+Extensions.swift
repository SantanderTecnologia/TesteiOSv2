//
//  File.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

extension UIViewController {
    class func replaceRootViewController(viewController: UIViewController) {
        guard
            let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
            let rootViewController = window.rootViewController
        else {
            return
        }
        viewController.view.frame = rootViewController.view.frame
        viewController.view.layoutIfNeeded()
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = viewController
        }, completion: nil)
    }
}
