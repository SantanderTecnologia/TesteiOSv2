//
//  Application+Extension.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarUIView: UIView? {
      if #available(iOS 13.0, *) {
          let tag = 38482
          let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

          if let statusBar = keyWindow?.viewWithTag(tag) {
              return statusBar
          } else {
              guard let statusBarFrame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return nil }
              let statusBarView = UIView(frame: statusBarFrame)
              statusBarView.tag = tag
              keyWindow?.addSubview(statusBarView)
              return statusBarView
          }
      } else if responds(to: Selector(("statusBar"))) {
          return value(forKey: "statusBar") as? UIView
      } else {
          return nil
      }
    }
}
