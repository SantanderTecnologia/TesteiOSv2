import Foundation

class Error: Codable {
    var message: String?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case message
        case code
    }
}

