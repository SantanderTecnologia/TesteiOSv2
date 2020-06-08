//
//  AlertViewSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Presenter

public class AlertViewSpy {
    public var viewModel: AlertViewModel?
    private var emit: ((AlertViewModel) -> Void)?
    
    public func observerViewModel(completion: @escaping (AlertViewModel) -> Void) {
        emit = completion
    }
}

extension AlertViewSpy: AlertViewProtocol {
    public func presentMessageWith(_ viewModel: AlertViewModel) {
        emit?(viewModel)
    }
}
