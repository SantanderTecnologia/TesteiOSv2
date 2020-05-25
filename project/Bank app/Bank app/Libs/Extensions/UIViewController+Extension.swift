import Foundation
import UIKit

enum Storyboards: String {
    case main = "Main"
    var storyboard: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
}

extension UIViewController {
    public class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    class func controller(from storyboards: Storyboards) -> Self? {
        return controller(in: storyboards.storyboard, identifier: nameOfClass)
    }
    
    class func controller(in storyboard: UIStoryboard, identifier: String) -> Self? {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    fileprivate class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T? {
        if let storyboard = storyboard.instantiateViewController(withIdentifier: identifier) as? T {
            return storyboard
        }
        
        return nil
    }
    
    static func topViewController() -> UIViewController? {
        return topViewController(withRoot: UIApplication.shared.keyWindow?.rootViewController)
    }
    
    static func topViewController(withRoot root: UIViewController?) -> UIViewController? {
        if let newRoot = (root as? UITabBarController)?.selectedViewController {
            return topViewController(withRoot: newRoot)
        }
        
        if let newRoot = (root as? UINavigationController)?.visibleViewController {
            return topViewController(withRoot: newRoot)
        }
        
        if let newRoot = root?.presentedViewController {
            return topViewController(withRoot: newRoot)
        }
        
        return root
    }
}
