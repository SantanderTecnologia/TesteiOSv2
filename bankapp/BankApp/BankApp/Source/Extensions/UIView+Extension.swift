//
//  UIView+Extension.swift
//  BankApp
//
//  Created by Pedro Veloso on 19/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

extension UIView {
    func rounded(radius: CGFloat) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
    
    func addShadow(radius: CGFloat) {
        DispatchQueue.main.async {
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = .zero
            self.layer.shadowRadius = radius
        }
    }
}
