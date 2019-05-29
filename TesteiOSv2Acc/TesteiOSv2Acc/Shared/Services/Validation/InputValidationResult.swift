//
//  InputValidationResult.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

struct InputValidationResult {
    let serviceError: ServiceError?
    
    func isValid() -> Bool
    {
        return serviceError == nil
    }
}
