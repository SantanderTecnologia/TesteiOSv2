//
//  UIView.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 05/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 1)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
    
}
