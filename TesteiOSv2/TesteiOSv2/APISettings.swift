//
//  APISettings.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 14/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class APISettings{
    ///Base url of the API
    static let baseUrl = URL(string: API_BASE_URL_STRING)!
    
    /**
     It adds one more string path to the base URL.
     - parameters:
     - path: String
     */
    static func composeURL(with path: String) -> URL {
        return baseUrl.appendingPathComponent(path)
    }
}
