//
//  ViewCode.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

protocol ViewCode {
    /**
     For add childrens classes to parente in order.
     */
    func buildViewHierarchy()
    /**
     For set the view constrainsts.
     */
    func setupConstraints()
    /**
     For set adicional configurations.
     */
    func setupAdditionalConfigurations()
    /**
     Call the others fuctions of this procotol in correct order.
     */
    func setupView()
}
extension ViewCode{
    func setupView(){
        
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfigurations()
    }
}
