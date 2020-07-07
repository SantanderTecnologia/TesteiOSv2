//
//  PaymentsModels.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

struct Payments {
    
    struct Received {
        
        struct UserAccount {
            var userId: Int?
            var name: String?
            var bankAccount: String?
            var agency: String?
            var balance: Double?
        }
    }
    
    struct Info {
        
        struct PaymentModel {
            let title: String
            let paymentInfo: String
            let date: String
            let value: String
        }
        
        struct ViewModel {
            
            struct Payment {
                var model: [PaymentModel]
            }
            
            struct UserAccount {
                let name: String
                let accountInfo: String
                let balance: String
            }
        }
    }
    
    struct Request {
        
        struct UserInfo { }
        
        struct Statements {
            let userId: String
        }
    }
    
    struct Response {
        
        struct Statements: Decodable {
            var title: String
            var desc: String
            var date: String
            var value: Double
        }
    }
    
    struct Constants {
        
        struct Colors {
            static let backgroundColor = UIColor(rgb: 0xffffff)
            static let cellLayerColor = UIColor(rgb: 0xd8dfe3)
            static let paymentFixedColor = UIColor(rgb: 0xa8b4c4)
            static let dateColor = UIColor(rgb: 0xa8b4c4)
            static let paymentColor = UIColor(rgb: 0x485465)
            static let valueColor = UIColor(rgb: 0x485465)
            static let headerBackgroundColor = UIColor(rgb: 0x3b49ee)
            static let headerTextColor = UIColor(rgb: 0xffffff)
        }
        
        struct Texts {
            static let paymentFixed = "Pagamento"
        }
        
        struct Fonts {
            static let paymentFixed = UIFont(name: "HelveticaNeue", size: 16)
            static let payment = UIFont(name: "HelveticaNeue", size: 16)
            static let date = UIFont(name: "HelveticaNeue", size: 12)
            static let value = UIFont(name: "HelveticaNeue-Light", size: 20)
        }
        
        struct Images {
            
        }
    }
}
