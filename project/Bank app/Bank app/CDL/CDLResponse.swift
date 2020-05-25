//  Bank app
//
//  Created by mmalaqui
//  Copyright © 2020 everis. All rights reserved.


import Foundation

enum CDLResponse<T>{
    case success(T)
    case failure(CDLErrorType)
}
