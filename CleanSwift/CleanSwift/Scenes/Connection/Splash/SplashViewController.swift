//
//  SplashViewController.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    private var router: SplashRouter
    private var realmWorker: RealmWorker
    
    init(router: SplashRouter, realmWorker: RealmWorker) {
        self.router = router
        self.realmWorker = realmWorker
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
    }
    
    private func loadLayout() {
        loading.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.loading.stopAnimating()
            self.router.routeToSomewhere(controller: self)
        })
    }
}
