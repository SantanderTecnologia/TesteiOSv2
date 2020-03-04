//
//  BaseTarget.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation
import Moya

protocol BaseTarget: TargetType {

}

extension BaseTarget {

    var baseURL: URL {
        return URL(string: "https://bank-app-test.herokuapp.com/api/")!
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }

    var sampleData: Data {
        return Data()
    }
}
