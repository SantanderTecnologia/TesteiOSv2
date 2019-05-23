//
//  NSError+Extension.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

extension NSError {
    static var noInternetError: NSError {
        return NSError(domain: "Sem conexão com a internet.", code: 001, userInfo: nil)
    }
    
    static var generalError: NSError {
        return NSError(domain: "Algo não está certo. Tente novamente em instantes.", code: 002, userInfo: nil)
    }
}
