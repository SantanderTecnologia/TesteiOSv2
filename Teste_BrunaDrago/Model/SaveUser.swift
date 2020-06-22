//
//  SaveUser.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 21/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation


class userManager {
    let file = "LoginInInfo.txt"
    func getStored () -> String {
        var user = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                try String(contentsOf: fileURL, encoding: .utf8)
                user = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {
                user = ""
            }
        }
        return user
    }
    func storeUser(user: String)-> Bool{
        var isStored = false
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let userCrypt = user
            let fileURL = dir.appendingPathComponent(file)
            do {
                try userCrypt.write(to: fileURL, atomically: false, encoding: .utf8)
                isStored =  true
            }
            catch {
                isStored = false
            }
        }
        

        return isStored
    }
}
