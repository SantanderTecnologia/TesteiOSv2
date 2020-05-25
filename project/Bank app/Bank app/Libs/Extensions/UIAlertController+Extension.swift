import Foundation
import UIKit

extension UIAlertController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    open override var shouldAutorotate: Bool {
        return false
    }
}
