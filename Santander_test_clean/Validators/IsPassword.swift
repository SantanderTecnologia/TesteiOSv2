
import Foundation

extension StringProtocol {
    var isValidPassword : Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@" , passwordRegex)
        if passwordTest.evaluate(with: self) {
            return true
        } else {
            return false
        }}
}

