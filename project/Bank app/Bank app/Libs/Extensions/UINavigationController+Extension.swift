import Foundation
import UIKit

extension UINavigationController {
    
    open override var shouldAutorotate: Bool {
        return true
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (visibleViewController?.supportedInterfaceOrientations)!
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return (visibleViewController?.preferredInterfaceOrientationForPresentation)!
    }
}
