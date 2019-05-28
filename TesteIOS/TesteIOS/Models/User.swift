//
//  User.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import ObjectMapper
import Realm
import RealmSwift

class User: Mappable {
    var userAccount: UserAccount?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        userAccount <- map["userAccount"]
    }
}

class UserAccount: Object, Mappable {
    @objc dynamic var userId: Int = -1
    @objc dynamic var name: String?
    @objc dynamic var bankAccount: String?
    @objc dynamic var agency: String?
    @objc dynamic var balance: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        let transform = TransformOf<String, Double>(fromJSON: { (value: Double?) -> String? in

            if let v = value {
                return v.toCurrency()
            }
            return nil
        }, toJSON: { (value: String?) -> Double? in
            if let value = value {
                return Double(value)
            }
            return nil
        })

        userId <- map["userId"]
        name <- map["name"]
        bankAccount <- map["bankAccount"]
        agency <- map["agency"]
        balance <- (map["balance"], transform)
    }

    func validUserAccount() -> Bool {
        return userId >= 0
    }

    func print() -> String {
        let ret = "UserAccount: userid=\(userId), name=\(String(describing: name)), bankAccount=\(String(describing: bankAccount)), agency=\(String(describing: agency)), balance=\(String(describing: balance))"
        return ret
    }
}
