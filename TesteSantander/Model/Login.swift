//
//  Login.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 09/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import Foundation

class Login {
    enum padroes: String {
        case alfanumerico = "0123456789"
        case caracterEsquisito = "`˜'?,._-$ˆ&*"
        case letraMaiuscula = "ABCDEFGHIJKLMNOPQRSTUVWYXZ"
        case email = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    }

}
