//
//  DataDecoding.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


protocol DataDecoding {
    static func decode<T>(_ object: T.Type, data: Data?) throws -> T where T : Decodable
}
