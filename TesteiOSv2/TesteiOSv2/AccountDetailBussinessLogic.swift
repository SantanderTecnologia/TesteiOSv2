//
//  AccountDetailBussinessLogic.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

protocol AccountDetailBussinessLogic{
    func updateUserAccountDetail(user: UserAccount)
    func fetchStatements()
}
