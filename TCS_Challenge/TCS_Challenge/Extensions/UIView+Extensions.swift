//
//  UIView+Extensions.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setShadow(color: UIColor = .darkGray,
                   opacity: Float = 1.0,
                   offset: CGSize = .zero) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
    
}
