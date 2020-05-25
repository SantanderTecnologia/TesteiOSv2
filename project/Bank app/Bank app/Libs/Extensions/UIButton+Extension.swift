import Foundation
import UIKit

extension UIButton {
    public func enable(enable: Bool) {
        self.isEnabled = enable
        if enable {
            self.alpha = 1.0
        } else {
            self.alpha = 0.5
        }
    }
}
