import Foundation
import UIKit

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
