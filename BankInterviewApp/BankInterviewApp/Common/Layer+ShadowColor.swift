//
//  Layer+ShadowColor.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import UIKit

extension CALayer {
    
    var shadowColorFromUIColor: UIColor {
        get {
            return UIColor(cgColor: shadowColor!)
        }
        
        set {
            shadowColor = newValue.cgColor
        }
    }
    
}
