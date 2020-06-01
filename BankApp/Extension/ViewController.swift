//
//  ViewController.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    
    public func startLoadingAnimation(_ ignoreInteractionEvents: Bool = true) {
        if ignoreInteractionEvents { UIApplication.shared.beginIgnoringInteractionEvents() }
        
        /**
         Display UI blocker.
         
         Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
         
         - parameter size:                 size of activity indicator view.
         - parameter message:              message displayed under activity indicator view.
         - parameter messageFont:          font of message displayed under activity indicator view.
         - parameter type:                 animation type.
         - parameter color:                color of activity indicator view.
         - parameter padding:              padding of activity indicator view.
         - parameter displayTimeThreshold: display time threshold to actually display UI blocker.
         - parameter minimumDisplayTime:   minimum display time of UI blocker.
         - parameter fadeInAnimation:      fade in animation.
         */
        startAnimating(type: .ballScaleRippleMultiple, color: .white)
    }
    
    public func stopLoadingAnimation(completition: (() -> Void)? = nil) {
        UIApplication.shared.endIgnoringInteractionEvents()
        self.stopAnimating()
        completition?()
    }
}
