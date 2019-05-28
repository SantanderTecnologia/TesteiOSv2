//
//  color.swift
//  TesteIOS
//
//  Created by Khalid Ait Bellahs on 26/04/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import UIKit



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        let newRed = CGFloat(Double(red) / 255.0)
        let newGreen = CGFloat(Double(green) / 255.0)
        let newBlue = CGFloat(Double(blue) / 255.0)
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(alpha))
    }
    
    //UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    //UIColor(rgb: 0xFFFFFF)
    //UIColor(rgb: 0x000000).withAlphaComponent(0.5)
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    //UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, a: 0.5)
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    //UIColor(rgb: 0xFFFFFF, a: 0.5)
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    //UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, a: 0xFF)
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    // let's suppose alpha is the first component (ARGB) UIColor(argb: 0xFFFFFFFF)
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}
