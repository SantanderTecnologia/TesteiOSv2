//
//  UIView.swift
//  WorkersLibrary
//
//  Created by LeandroLee on 07/04/21.
//

import UIKit

extension UIView
{
      
      public func startLoadingOnActiveView() -> UIView
      {
            let loadingV = UIView.init(frame: self.bounds)
            loadingV.backgroundColor = uiColorGray.withAlphaComponent(0.69)
                        
            let activityIndicatorV = UIActivityIndicatorView()
            activityIndicatorV.color = uiColorApp
            activityIndicatorV.center = self.center
            
            DispatchQueue.main.async
            {
                  loadingV.addSubview(activityIndicatorV)
                  
                  activityIndicatorV.startAnimating()
                  
                  self.addSubview(loadingV)
            }
            
            return loadingV
      }
      
      public func stopLoadingOnActiveView(_ onView : UIView)
      {
            onView.removeFromSuperview()
      }
}
