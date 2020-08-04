//
//  TimelineViewControllerDelegate.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

protocol TimelineViewControllerDelegate: AnyObject {
    func didTappedLogout()
}

extension TimelineCoordinator: TimelineViewControllerDelegate {
    func didTappedLogout() {
        didFinishCoordinatorFlow()
    }
}
