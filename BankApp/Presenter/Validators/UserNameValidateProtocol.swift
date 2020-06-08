//
//  UserNameValidateProtocol.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol UserNameValidateProtocol {
    @discardableResult func isValid(userName: String?) -> Bool
}
