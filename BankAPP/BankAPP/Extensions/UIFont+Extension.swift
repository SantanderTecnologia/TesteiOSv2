//
//  UIFont+Extension.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 28/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit

extension UIFont {

     func withTrais(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let ft = fontDescriptor.withSymbolicTraits(traits) else {return self}
        return UIFont(descriptor: ft, size: pointSize)
    }
    
    func bold() -> UIFont {
        return withTrais(traits: .traitBold)
    }
    
    func setFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Não existe esta fonte: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func fontAppDefault(size: CGFloat) -> UIFont {
        return setFont(name: "HelveticaNeue", size: size)
    }
    
    func fontAppLight(size: CGFloat) -> UIFont {
        return setFont(name: "HelveticaNeue-Light", size: size)
    }
    
}
