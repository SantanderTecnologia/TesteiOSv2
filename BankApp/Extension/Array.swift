//
//  Array.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import UIKit

extension Array {
    public func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
