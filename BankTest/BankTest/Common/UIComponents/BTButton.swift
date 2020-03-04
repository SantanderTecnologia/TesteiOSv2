//
//  BTButton.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import UIKit

@IBDesignable
class BTButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet  {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    var showShadow: Bool = false {
        didSet {
            if showShadow {
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.5
                layer.shadowOffset = .zero
                layer.shadowRadius = 3
            }
        }
    }
}
