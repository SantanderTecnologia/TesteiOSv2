//
//  UITextField+Extension.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setState(state : Bool){
        if(state){
            self.borderWidth = 0
        }else{
            self.shake()
            self.borderWidth = 2
            self.borderColor = (UIColor(named: "errorColor")) ?? UIColor.red
        }
    }
}
