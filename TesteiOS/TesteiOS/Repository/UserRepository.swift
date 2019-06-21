//
//  UserRepository.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 15/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import RealmSwift

class UserRepository {
    static let shared = UserRepository()
    var realm: Realm
    
    private init() {
        let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { _, oldSchemaVersion in
            if oldSchemaVersion < 1 {
            }
        }, objectTypes: [UserAccount.self])
        realm = try! Realm(configuration: config)
    }
    
    func saveUser(user: UserAccount) {
        try! realm.write {
            realm.deleteAll()
            realm.add(user)
        }
    }
    
    func getUser(callback: @escaping (_ user: UserAccount?) -> Void) {
        try! realm.write {
            let user = realm.objects(UserAccount.self)
            callback(user.last)
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
