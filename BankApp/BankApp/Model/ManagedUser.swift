//
//  ManagedUser.swift
//  BankApp
//
//  Created by Visão Grupo on 7/21/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation
import CoreData

public class ManagedUser: NSManagedObject {
    
    @NSManaged public var userId: Int64
    @NSManaged public var password: String?
    @NSManaged public var user: String?
    @NSManaged public var name: String?
    @NSManaged public var bankAccount: String?
    @NSManaged public var agency: String?
    @NSManaged public var balance: Double
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedUser> {
        return NSFetchRequest<ManagedUser>(entityName: "ManagedUser")
    }
    
    func toUser() -> User {
        let userId = Int(self.userId)
        let password = self.password ?? ""
        let user = self.user ?? ""
        let name = self.user ?? ""
        let bankAccount = self.bankAccount ?? ""
        let agency = self.agency ?? ""
        return User(userId: userId, login: user, password: password, name: name, bankAccount: bankAccount, agency: agency, balance: balance)
    }
    
    func fromUser(_ user: User) {
        self.userId = Int64(user.userId)
        self.password = user.password
        self.user = user.login
        self.name = user.name
        self.bankAccount = user.bankAccount
        self.agency = user.agency
        self.balance = user.balance
    }
}
