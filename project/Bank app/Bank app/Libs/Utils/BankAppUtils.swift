//
//  BankAppUtils.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class BankAppUtils {
    static func getXib(xibFile: XibFile) -> String {
        return xibFile.rawValue
    }
    
    
    static var baseURL = "https://bank-app-test.herokuapp.com/api/"
}
