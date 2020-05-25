//
//  LoginViewModel.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Login
class LoginViewModel {
    var idLogin: String?
    
    var password: String?
    var username : String?
    
    init() {}
    init(loginInteractorModel : LoginInteractorModel){
        //TODO: convert to viewModel
    }

}
