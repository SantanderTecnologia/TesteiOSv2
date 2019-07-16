//
//  RefreshableCollectionView.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

import UIKit

class RefreshableCollectionView: UICollectionView {
    
    @IBInspectable var isResponsive: Bool = false {
        didSet {
            delaysContentTouches = !isResponsive
            
            subviews.forEach { ($0 as? UIScrollView)?.delaysContentTouches = !isResponsive }
        }
    }
    
    var refreshHandler: (() -> Void)?
    
    var refreshControl9: UIRefreshControl = UIRefreshControl()
    
    func refreshControl() -> UIRefreshControl {
        if #available(iOS 10.0, *) {
            if let refresh = self.refreshControl {
                return refresh
            }else{
                self.refreshControl = UIRefreshControl()
                return self.refreshControl!
            }
        } else {
            return self.refreshControl9
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refresh.layer.zPosition = -1
        
        if #available(iOS 10.0, *) {
            self.refreshControl = refresh
        }else{
            
            self.refreshControl9 = refresh
            self.addSubview(refreshControl9)
            self.alwaysBounceVertical = true
        }
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return isResponsive
    }
    
    @objc private func refresh(_ sender: Any) {
        perform(#selector(callHandler), with: nil, afterDelay: 0, inModes: [RunLoop.Mode.default])
    }
    
    @objc private func callHandler() {
        refreshHandler?()
    }
    
}
