//
//  HomeViewControllerBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class HomeViewControllerBuilder {
    
    static func make(wireframe: HomeWireframe) -> HomeViewController {
        let presenter = HomePresenterBuilder.make(wireframe: wireframe)
        let layout = UICollectionViewFlowLayout()
        let viewControler = HomeViewController(collectionViewLayout: layout)
        viewControler.presenter = presenter
        presenter.output = viewControler
        
        return viewControler
    }
}
