//
//  CSNavigationBar.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import UIKit

///Our navigationBar's customized
class CSNavigationBar: UINavigationBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppNavigationBar() {
        barTintColor = .navColor
        titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
