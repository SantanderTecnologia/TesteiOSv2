//
//  String.swift
//  TesteIOS
//
//  Created by Khalid Ait Bellahs on 27/05/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation


extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}
