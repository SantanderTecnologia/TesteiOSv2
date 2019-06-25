import Foundation


extension StringProtocol {
    
    var isNumber: Bool {
        return Int(self) != nil
    }
}
