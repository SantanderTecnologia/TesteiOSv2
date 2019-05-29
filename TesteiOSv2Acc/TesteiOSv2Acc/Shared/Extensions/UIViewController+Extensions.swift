//
//  UIViewController+Extensions.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoading()
    {
        
        if let activityIndicator = view.viewWithTag(-8765) as? UIActivityIndicatorView
        {
            activityIndicator.startAnimating()
            return
        }
        
        let activityIndicator = UIActivityIndicatorView()
        
        let selfFrame = self.view.frame
        activityIndicator.frame = CGRect(x: selfFrame.origin.x, y: selfFrame.origin.y, width: selfFrame.width, height: selfFrame.height)
        activityIndicator.backgroundColor = UIColor.init(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.4)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tag = -8765
        
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideLoading()
    {
        if let activityIndicator = view.viewWithTag(-8765) as? UIActivityIndicatorView
        {
            activityIndicator.stopAnimating()
        }
    }
    
}
