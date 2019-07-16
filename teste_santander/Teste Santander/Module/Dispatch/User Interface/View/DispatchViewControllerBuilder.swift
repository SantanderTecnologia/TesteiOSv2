//
//  DispatchViewControllerBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class DispatchViewControllerBuilder: StoryboardInstanciate {
    var storyboardName: String = "Dispatch"
    
    func makeScreen(wireframe: DispatchWireframe) -> DispatchViewController {
        let presenter = DispatchPresenterBuilder.make(wireframe: wireframe)
        let viewController = viewControllerFromStoryboard(withIdentifier: "DispatchViewController") as! DispatchViewController
        viewController.presenter = presenter
        
        return viewController
    }
}
