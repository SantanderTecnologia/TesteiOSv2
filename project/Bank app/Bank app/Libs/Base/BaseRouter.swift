//  Bank app
//
//  Created by mmalaqui
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter <Presenter: Any, ViewController: Any>: NSObject {
    
    internal var presenter: Presenter?
    internal var view: UIViewController?
    
    //Init
    convenience init(presenter: Presenter? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.view = view
    }
    
    // MARK: PRIVATE BASE
    internal func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        if let navigationController = self.view?.navigationController {
            navigationController.setViewControllers([viewControllerToPresent], animated: flag)
        }
    }
    
    internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        if let navigationController = self.view?.navigationController {
            navigationController.pushViewController(viewControllerToPresent, animated: flag)
        }
    }
    
    internal func popViewController(animated: Bool) {
        if let navigationController = self.view?.navigationController {
            navigationController.popViewController(animated: animated)
        }
    }
    
    internal func popToViewController(toViewController: UIViewController, animated: Bool) {
        if let navigationController = self.view?.navigationController {
            navigationController.popToViewController(toViewController, animated: animated)
        }
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.view?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    internal func dismiss(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.view?.dismiss(animated: flag, completion: completion)
    }
}
