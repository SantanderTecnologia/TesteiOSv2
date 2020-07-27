//
//  ViewControllerConfigurating.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


protocol ViewControllerConfigurating: class {
    func setup()
    func prepareViews()
    func addViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewControllerConfigurating {
    func setup() {
        prepareViews()
        addViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
