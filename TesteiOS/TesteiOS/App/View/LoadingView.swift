//
//  LoadingView.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    class func instanceFromNib(rect: CGRect) -> LoadingView? {
        let view = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? LoadingView
        view?.frame = rect
        return view
    }
    
}
