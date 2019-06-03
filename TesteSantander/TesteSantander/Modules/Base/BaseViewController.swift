//
//  BaseViewController.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.tintColor = UIColor.warmBlue
        indicator.color = UIColor.warmBlue
        view.addSubview(indicator)
        indicator.pinToSuperview()
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
