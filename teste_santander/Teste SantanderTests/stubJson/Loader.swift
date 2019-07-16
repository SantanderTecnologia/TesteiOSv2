//
//  Loader.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import ObjectMapper

@testable import Pods_Teste_Santander

class Loader {
    
    @discardableResult
    static func mock<T: Mappable>(file: String) -> T? {
        guard let data = loadFile(with: file)else {
                return nil
        }
        
        let modelJson = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        let result = Mapper<T>().map(JSONObject:modelJson)
        
        return result
    }
    
    private static func loadFile(with name: String) -> Data? {
        guard let urlPath = Bundle(for: Loader.self).path(forResource: name, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: urlPath), options: .mappedIfSafe) else {
                return nil
        }
        return data
    }
}
