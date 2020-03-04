//
//  Data+JSON.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

extension Data {

    func parse<T: Codable>(to: T.Type) -> T?{
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
}
