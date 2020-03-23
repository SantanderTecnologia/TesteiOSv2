//
//  ViewControlerExtension.swift
//  Bank_App
//
//  Created by apple on 20/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showAlertErrorMessage(message: String) {
    let alert = UIAlertController(title: "Ops", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
}
