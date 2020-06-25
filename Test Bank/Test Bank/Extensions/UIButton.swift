//
//  UIButton.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 20/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setShadow() {
        layer.shadowColor = UIColor.shadowButtonColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    func setRadius() {
        layer.cornerRadius = 8.0
    }
    
}
