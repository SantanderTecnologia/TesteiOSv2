
import Foundation


class UserAccount: Codable {
    var userId: Int?
    var name : String?
    var bankAccount : String?
    var agency : String?
    var balance : Decimal?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case bankAccount
        case agency
        case balance
        
    }
}
