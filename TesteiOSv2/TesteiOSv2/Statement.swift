//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

struct Statement : Decodable{
    let title : String
    let desc : String
    let date : String
    let value: Double
}
