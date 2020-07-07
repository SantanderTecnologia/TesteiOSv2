//
//  LocalSaves.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

class LocalSaves {
    
    static let shared = LocalSaves()
    
    private let userDefaults = UserDefaults.standard
    private let emailStr = "email"
    private let passwordStr = "password"
    
    private init() { }
    
    func saveLastUser(email: String,
                      password: String) {
        userDefaults.setValue(email, forKey: emailStr)
        userDefaults.setValue(password, forKey: passwordStr)
    }
    
    func getUserInfo() -> (String?, String?) {
        return (userDefaults.string(forKey: emailStr), userDefaults.string(forKey: passwordStr))
    }
}
