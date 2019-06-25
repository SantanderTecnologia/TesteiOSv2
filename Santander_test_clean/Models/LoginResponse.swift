
import Foundation

class LoginResponse: Decodable {
    var userAccount : UserAccount?
    var error : Error?
}
