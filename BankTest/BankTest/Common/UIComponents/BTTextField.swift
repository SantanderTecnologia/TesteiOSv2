//
//  BTTextField.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import UIKit

@IBDesignable
class BTTextField: UITextField {

    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }

    @IBInspectable
    var showBorder: Bool = false {
        didSet {
            if showBorder {
                layer.borderWidth = 1
                layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
}
