//
//  Utilities.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 25/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", Constants.String.passRequirements)
        
        return passwordTest.evaluate(with: password)
    }
    
    
}
