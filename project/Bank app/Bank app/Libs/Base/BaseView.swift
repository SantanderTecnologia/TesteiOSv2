//  Bank app
//
//  Created by mmalaqui
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class BaseView<Presenter: Any>: BaseViewController {
    internal var presenter: Presenter?
}
