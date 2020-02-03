//
//  Extensions.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 29/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(message: String) {
        let alertController = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
