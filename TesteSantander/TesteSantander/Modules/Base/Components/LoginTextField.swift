//
//  LoginTextField.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

final class LoginTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    fileprivate func setup() {
        // Setup placeholder font
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.lightGreyBlue,
                .font: UIFont.helveticaNeue(size: 15)
            ]
        )
        
        // Setup text font
        font = UIFont.helveticaNeue(size: 15)
        textColor = UIColor.warmBlue
        
        // Setup border
        layer.masksToBounds = true
        layer.cornerRadius = 4
        layer.borderColor = UIColor.lightPeriwinkle.cgColor
        layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // Setup placeholder padding
        return bounds.insetBy(dx: 13, dy: 13)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // Setup text padding
        return bounds.insetBy(dx: 13, dy: 13)
    }
    
}
