//
//  Date.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-06.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

extension Date {
    public var fullFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}
