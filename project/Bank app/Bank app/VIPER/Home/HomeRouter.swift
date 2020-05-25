//
//  HomeRouter.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    func presentDetailView()
}

final class HomeRouter: BaseRouter<HomePresenterProtocol, HomeView>, HomeRouterProtocol {

    internal func presentDetailView() {
        
    }
}
