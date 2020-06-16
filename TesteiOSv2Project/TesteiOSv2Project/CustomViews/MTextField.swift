//
//  MTextField.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import UIKit

@IBDesignable
class MTextField: UITextField {
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.8889737129, green: 0.909596622, blue: 0.9469546676, alpha: 1){
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 4 {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }
    
    @IBInspectable var placeholderTextColor: UIColor = #colorLiteral(red: 0.7154890895, green: 0.758533895, blue: 0.8112761974, alpha: 1){
        didSet{
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                       attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 13, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 13, dy: 0)
    }
    
    fileprivate func commonInit(){
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = borderRadius
        layer.borderWidth = borderWidth
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor])
    }
}
