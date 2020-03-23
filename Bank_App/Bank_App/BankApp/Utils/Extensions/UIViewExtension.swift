//
//  UIViewExtension.swift
//  BankApp
//
//  Created by apple on 23/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
//

import UIKit

extension UIView {
  
  func dropShadow() {
    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.6
    self.layer.shadowOffset = CGSize(width: 1, height: 1)
    self.layer.shadowRadius = 4
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    self.layer.shouldRasterize = true
    self.layer.rasterizationScale = UIScreen.main.scale
  }
}
