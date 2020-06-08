//
//  UIControl+Extensions.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

extension UIControl {
    func simulate(for envent: UIControl.Event) {
        allTargets.forEach { target in
            let actions = self.actions(forTarget: target, forControlEvent: envent)
            actions?.forEach { action in
                let targetAsNSObject = (target as NSObject)
                let selector = Selector(action)
                targetAsNSObject.perform(selector)
            }
        }
    }
    
    func simulateTap() {
        simulate(for: .touchUpInside)
    }
}
