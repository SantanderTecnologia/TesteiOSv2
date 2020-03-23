//
//  LoadingView.swift
//  Bank_App
//
//  Created by apple on 22/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
//

import UIKit

class LoadingView: UIView {
  @IBOutlet var uiView: UIView!
  
  // once with a NSCoder
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
    self.uiView.frame = bounds
    self.addSubview(self.uiView)
  }
  
  // for this to work programmatically I had to do the same...
  override init(frame: CGRect) {
    super.init(frame: frame)
    Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
    self.uiView.frame = bounds
    self.addSubview(self.uiView)
  }
}
