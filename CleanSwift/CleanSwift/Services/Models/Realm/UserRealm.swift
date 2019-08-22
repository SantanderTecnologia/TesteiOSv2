//
//  User.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var userId: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var account: String = ""
    @objc dynamic var balance: String = ""
    
    override static func primaryKey() -> String {
        return "userId"
    }
}
