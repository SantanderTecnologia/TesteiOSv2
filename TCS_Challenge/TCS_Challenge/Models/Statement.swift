//
//  Statement.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

struct Statement: Decodable {
    var title: String
    var desc: String
    var date: String
    var value: Double
}
