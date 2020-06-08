//
//  ModelToData.swift
//  Data
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public extension Data {
    func convertToModel<T: Decodable>() -> T? {
       return try? JSONDecoder().decode(T.self, from: self)
    }
}
