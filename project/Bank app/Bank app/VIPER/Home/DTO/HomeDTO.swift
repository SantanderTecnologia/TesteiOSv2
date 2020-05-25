//
//  HomeDTO.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//class that represents the transfer object of Home
class HomeDTO {
    var user : HomeUserDTO?
}

class HomeUserDTO {
    var id : Int?
    var name : String?
    var accountNumber : String?
    var agencyID : String?
    var balance : Float?
}
