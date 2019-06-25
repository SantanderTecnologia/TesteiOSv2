
import UIKit
import Foundation

protocol LoginBusinessLogic
{
    func requestLogin(user: String, password: String)
    func checkUser(user: String, password: String)
    func buttonIsEnable(user: Bool, password: Bool)
}

protocol LoginDataStore
{
    var userAccount: UserAccount { get set }
}

struct DataUserAuthentication: Encodable {
    var user: String
    var password: String
}


class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic!
    var worker: LoginWorker?
    var userAccount = UserAccount()
    
    func checkUser(user: String, password: String) {
        
        guard (user.isValidCPF || user.isValidEmail) && password.isValidPassword else {
            presenter?.alertValidUser(result: false)
            return
        }
        requestLogin(user: user, password: password)
    }
    
    func buttonIsEnable(user: Bool, password: Bool) {
        if user && password {
            let isEnabled: Bool = true
            let color: UIColor = UIColor(cgColor: #colorLiteral(red: 0.231372549, green: 0.2823529412, blue: 0.9333333333, alpha: 1))
            presenter?.buttonIsEnable(isValid: isEnabled, color: color)
        } else {
            let isEnabled: Bool = false
            let color: UIColor = UIColor(cgColor: #colorLiteral(red: 0.231372549, green: 0.2823529412, blue: 0.9333333333, alpha: 0.8895703125))
            presenter?.buttonIsEnable(isValid: isEnabled, color: color)
        }
    }
    
    func responseAuthenticantionUser(data: LoginResponse){
        if let userAccount = data.userAccount {
            presenter?.dataUserValid(data: userAccount)
        }
    }

    func requestLogin(user: String, password: String) {
        let data = DataUserAuthentication(user: user, password: password)
        worker = LoginWorker()
        worker?.authenticatorLogin(from: data, completion: { (user) in
            if let userAccount = user.userAccount {
                self.presenter?.dataUserValid(data: userAccount)
            }
        }, failure: { (message) in
            
        })
  }
}
