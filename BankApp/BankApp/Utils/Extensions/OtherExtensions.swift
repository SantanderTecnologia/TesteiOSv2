//
//  OtherExtensions.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

extension Data {
    func printContent() {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8) {
            print(JSONString)
        }
    }
}

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 2
    }
}
