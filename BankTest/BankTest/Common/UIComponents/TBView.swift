//
//  TBView.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import UIKit

@IBDesignable
class TBView: UIView {

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
                layer.shadowOpacity = 0.2
                layer.shadowOffset = .zero
                layer.shadowRadius = 3
            }
        }
    }
}
