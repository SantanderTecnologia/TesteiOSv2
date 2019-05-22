//
//  RoundedView.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 26/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.cornerRadius
        layer.masksToBounds = true
   
    }
    
}
