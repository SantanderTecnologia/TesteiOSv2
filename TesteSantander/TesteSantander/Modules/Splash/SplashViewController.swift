//
//  SplashViewController.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 31/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    static let logoAnimation = "logoAnimation"
    static let buttonAnimation = "buttonAnimation"
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.fastAnimation { [unowned self] in
            self.logoImageView.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
            self.presentLoginAnimated()
        }
    }
    
    fileprivate func setup() {
        logoImageView.alpha = 0
        logoImageView.hero.id = SplashViewController.logoAnimation
        backgroundView.hero.id = SplashViewController.buttonAnimation
    }
    
    fileprivate func presentLoginAnimated() {
        let loginViewController = LoginViewController()
        loginViewController.hero.isEnabled = true
        show(loginViewController, sender: nil)
    }

}
