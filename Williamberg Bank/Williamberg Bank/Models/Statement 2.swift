//
//  Statement.swift
//  Williamberg Bank
//
//  Created by padrao on 24/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import Foundation

struct Statement: Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}
