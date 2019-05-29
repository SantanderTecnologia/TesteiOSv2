//
//  LoginResponse.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 24/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

struct LoginResponse: Codable {
    let userAccount: UserAccount?
    let error: ServiceError?
}
