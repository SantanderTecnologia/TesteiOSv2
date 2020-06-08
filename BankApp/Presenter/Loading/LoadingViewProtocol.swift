//
//  LoadingViewProtocol.swift
//  Presenter
//
//  Created by Estaife Lima on 04/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol LoadingViewProtocol {
    var isLoading: Bool { get }
    func start()
    func stop()
}
