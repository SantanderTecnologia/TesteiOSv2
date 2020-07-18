//
//  CurrencyViewModel.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 11/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

protocol CurrencyStatementDelegate: class {
    func isError(isError: Bool)
}

class CurrencyViewModel {
    
    let apiManager: ApiManagerDelegate
    var userAccount = [DataUser]()
    var statementUser = [StatementUser]()
    var statementList = [StatementList]()
    var usuarioKey = "Usuario"
    weak var delegate: CurrencyStatementDelegate?
    
    init(apiManager: ApiManagerDelegate) {
        self.apiManager = apiManager
    }
    
    func loadLogin(completion: @escaping (ValidationError?) -> Void) {
        
        apiManager.getLoginSerealization { [weak self] (login, error) in
            guard let self = self, let logins = login else {
                completion(error)
                return
            }
            if error == nil {
                self.userAccount = logins
                completion(nil)
                return
            }
            completion(error)
            return
        }
    }
    
    func loadStatement(completion: @escaping (ValidationError?) -> Void) {
        apiManager.getStatementSerealization { [weak self] (statementList, error) in
            guard let self = self, let statementUser = statementList else {
                completion(error)
                return
            }
            if error == nil {
                self.statementUser = statementUser
                completion(nil)
                return
            }
            completion(error)
            return
        }
    }
    
    private func getStatements() {
        loadStatement { [weak self] (error) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                if error == nil {
                    self.delegate?.isError(isError: false)
                }else{
                    self.delegate?.isError(isError: true)
                }
            }
        }
    }
    
    func checkIsValidLogin(loginType: LoginType, user: String) -> (Bool, DataUser) {
        getStatements()
        
        var isValid: Bool = false
        var dataUser: DataUser?
        
        let userEmail = (loginType == .email) ? userAccount.filter({$0.email == user}) : userAccount.filter({$0.cpf == user})
        if userEmail.count > 0 {
            isValid = true
            
            for info in userEmail {
                dataUser = DataUser(userId: info.userId, email: info.email, cpf: info.cpf, name: info.name, bankAccount: info.bankAccount, agency: info.agency, balance: info.balance)
                self.statementList = loadStatementListFromUser(userId: dataUser?.userId ?? 0)
            }
        }else{
            isValid = false
            dataUser = nil
        }
        guard let data = dataUser else {return (false, DataUser(userId: 0, email: "", cpf: "", name: "", bankAccount: "", agency: "", balance: 0.0)) }
        saveLastUserLogged(userLogged: data)
        
        return (isValid, data)
    }
    
    func saveLastUserLogged(userLogged: DataUser) {
        do {
            let usuarioData = try JSONEncoder().encode(userLogged)
            UserDefaults.standard.set(usuarioData, forKey: usuarioKey)
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    func loadUsuarioLogged() -> DataUser? {
        do {
            guard let usuarioData = UserDefaults.standard.data(forKey: usuarioKey) else { return nil}
            let usuario = try JSONDecoder().decode(DataUser.self, from: usuarioData)
            return usuario
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func loadStatementListFromUser(userId: Int) -> [StatementList] {
        var statementList = [StatementList]()
        for user in statementUser {
            if user.userId == userId {
                statementList = user.statementList
            }
        }
        return statementList
    }
}
