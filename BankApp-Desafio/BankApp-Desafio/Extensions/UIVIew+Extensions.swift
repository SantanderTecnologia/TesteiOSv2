//
//  UIVIew+Extensions.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

extension UIView {
    func contraintAllEdges(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
