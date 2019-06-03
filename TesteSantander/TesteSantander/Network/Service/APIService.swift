//
//  APIService.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol APIService {
    func login(_ user: String, _ password: String) -> Single<Response>
    func fetchStatements(_ userId: Int) -> Single<Response>
}
