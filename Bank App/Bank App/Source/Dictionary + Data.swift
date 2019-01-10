//
//  Dictionary + Data.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 09/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

extension Dictionary {
    
    public func convertToJsonData() throws -> Data {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            return jsonData
            
        } catch {
            throw error
        }
    }
    
    public func convertToJsonString() throws -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            throw error
        }
    }
}
