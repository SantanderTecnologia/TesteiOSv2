//
//  UIViewController+Extensions.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

public final class AlertController {
    public var isShowing: Bool = false
    
    public func showAlert(title: String? = nil, message: String? = nil, and style: UIAlertController.Style, into viewController: UIViewController) {
        isShowing.toggle()
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        viewController.present(alertController, animated: true) { self.isShowing.toggle() }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            viewController.dismiss(animated: true)
        }
    }
}

