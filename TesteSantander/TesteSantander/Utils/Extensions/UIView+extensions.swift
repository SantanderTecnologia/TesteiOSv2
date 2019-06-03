//
//  UIView+extensions.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

// Animations
extension UIView {
    func fastAnimation(animation: @escaping () -> Void) {
        UIView.animate(
            withDuration: 0.25,
            animations: animation)
    }
}

// Contraints
extension UIView {
    func pinToSuperview() {
        snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
