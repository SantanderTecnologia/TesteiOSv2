//
//  TextField+Extension.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setCPFMask()
    {
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        if textField.text != nil, !textField.text!.isEmpty {
            if let isNumber = textField.text?.first?.isNumber, isNumber, !textField.text!.contains("@") {
                textField.text = textField.text!.applyPatternOnNumbers(pattern: "###.###.###-##", replacmentCharacter: "#")
            }
        }
    }
}
