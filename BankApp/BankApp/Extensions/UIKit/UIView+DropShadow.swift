//
//  UIView+DropShadow.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDropShadow(color: UIColor, offset: CGSize, radius: CGFloat, opacity: Float) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset =  offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
        layer.cornerRadius = radius
    }
    
}
