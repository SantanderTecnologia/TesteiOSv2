//  Bank app
//
//  Created by mmalaqui
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class BasePresenter <View: AnyObject, Router: Any, Interactor: Any>: NSObject {
    
    internal weak var view: View?
    internal var router: Router?
    internal var interactor: Interactor?
    
    //Init
    convenience init(view: View, router: Router? = nil, interactor: Interactor? = nil) {
        self.init()
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}
