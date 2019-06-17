//
//  ViewController.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /// Dismisses the current view contextually
    ///
    /// The view checks its current context to automatically decide the best way it can close itself,
    /// in case it is not connected to a navigation controller or is the only view in the navigation stack it dismisses,
    /// otherwise it pops itself out of its navigation controller
    func close() {
        if let controller = navigationController,  controller.viewControllers.count >= 1 {
            controller.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
