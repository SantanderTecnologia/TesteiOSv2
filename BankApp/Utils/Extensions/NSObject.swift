//
//  NSObject.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation

extension NSObject{
    var typeName: String{
        return String(describing: type(of: self))
    }
    
    static var typeName: String{
        return String(describing: self)
    }
}
