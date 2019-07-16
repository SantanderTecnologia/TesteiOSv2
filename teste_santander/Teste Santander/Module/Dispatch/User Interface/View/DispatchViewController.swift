//
//  DispatchViewController.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {
    
    var presenter: DispatchPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
