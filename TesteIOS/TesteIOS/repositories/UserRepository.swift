//
//  LoginRepository.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import Foundation
import RealmSwift

class UserRepository {
    static let shared = UserRepository()
    var realm: Realm

    private init() {
        let config = Realm.Configuration(schemaVersion: 5, migrationBlock: { _, oldSchemaVersion in
            if oldSchemaVersion < 4 {
            }
        }, objectTypes: [UserAccount.self])
        realm = try! Realm(configuration: config)
    }

    func saveUser(userAccount: UserAccount) {
        try! realm.write {
            realm.deleteAll()
            realm.add(userAccount)
        }
    }

    func getUser(callback: @escaping (_ user: UserAccount?) -> Void) {
        try! realm.write {
            let users = realm.objects(UserAccount.self)
            callback(users.last)
        }
    }

    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
