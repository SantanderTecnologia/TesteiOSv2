//
//  UIFont+extensions.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func helveticaNeue(size: CGFloat) -> UIFont {
        return loadFont(UIFont(name: "HelveticaNeue", size: size))
    }
    
    static func helveticaNeueLight(size: CGFloat) -> UIFont {
        return loadFont(UIFont(name: "HelveticaNeue-Light", size: 25.0))
    }
    
    static func loadFont(_ font: UIFont?) -> UIFont {
        guard let font = font else {
            fatalError(Constants.Errors.loadFont)
        }
        return font
    }
    
}
