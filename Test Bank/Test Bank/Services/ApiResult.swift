//
//  ApiResult.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 22/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import Foundation

enum ApiResult<T> {
    case success(T)
    case failure(ApiError)
    
    func toResult() -> ApiResult<T> {
        switch self {
        case .success(let value):
            return ApiResult.success(value)
        case .failure(let value):
            return ApiResult.failure(value)
        }
    }
}

extension ApiResult {
    var value: T? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    var failure: ApiError? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
