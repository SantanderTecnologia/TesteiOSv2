//
//  RealmWorker.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorker {
    let realm = try? Realm()
    
    func saveObjc(obj: Object) {
        try? realm?.write {
            realm?.add(obj)
        }
    }
    
    func updateObj(obj: UserRealm) {
        try? realm?.write {
            realm?.add(obj, update: .modified)
        }
    }
    
    func deleteObj(obj: UserRealm) {
        try? realm?.write {
            realm!.delete(obj)
        }
    }
    
    func getObj() -> UserRealm? {
        let obj = realm?.objects(UserRealm.self)
        return obj?.first
    }
}
