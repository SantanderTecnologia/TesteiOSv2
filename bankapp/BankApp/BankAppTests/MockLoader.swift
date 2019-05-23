//
//  MockLoader.swift
//  BankAppTests
//
//  Created by Pedro Veloso on 22/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

class MockLoader <T:Codable> {
    class func loadMock(nameOfFile: String? = nil) -> T {
        let resource = nameOfFile ?? "\(T.self)"
        let bundle = Bundle(for: MockLoader.self)
        guard let path = bundle.path(forResource: resource, ofType: "json") else {
            fatalError("File not found: \(resource)")
        }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch {
            fatalError("File at path \(path) is not a valid json object of type \(T.self)")
        }
    }
}
