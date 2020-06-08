//
//  RouterSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter
import Domain

class RouterSpy {
    
    public var userAccount: UserAccountModel?
    private var emit: ((UserAccountModel) -> Void)?
    
    public func observerUserAccount(completion: @escaping (UserAccountModel) -> Void) {
        emit = completion
    }
}

extension RouterSpy: RouterProtocol {
    func presentBalanceViewController(userAccount: UserAccountModel) {
        emit?(userAccount)
    }
}
