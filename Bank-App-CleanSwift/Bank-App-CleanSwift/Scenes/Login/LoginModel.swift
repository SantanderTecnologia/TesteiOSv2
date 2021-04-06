//
//  LoginModel.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum Login {
    struct LoginFields {
        var username: String
        var password: String
    }
    
    enum Login {
        struct Request {
            var fields: LoginFields
        }
        
        struct Response {
            var user: UserAccount?
            var error: ErrorMessage?
        }
        
        struct ViewModel {
            var user: UserAccount?
            var error: ErrorMessage?
            
            init(user: UserAccount?, error: ErrorMessage?) {
                self.user = user
                self.error = error
                
                if let code = self.error?.code {
                    if code == 53 {
                        // Put a friendly message instead of the default api message
                        self.error?.message = Constants.WRONG_FIELDS_MESSAGE
                    }
                }
            }
        }
    }
    
    enum FetchLastLoggedUser {
        struct Request {}
        
        struct Response {
            let username: String?
        }
        
        struct ViewModel {
            let username: String
            
            init(username: String?) {
                self.username = username ?? ""
            }
        }
    }
}
