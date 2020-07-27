//
//  JSONDataDecoder.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


public struct JSONDataDecoder: DataDecoding {
    static func decode<T>(_ object: T.Type, data: Data?) throws -> T where T : Decodable {
        guard let data = data, !data.isEmpty else {
            throw NetworkError.emptyData
        }
        do {
            let objectDecoded = try JSONDecoder().decode(object, from: data)
            return objectDecoded
        } catch {
             throw NetworkError.parserError
        }
    }
}
