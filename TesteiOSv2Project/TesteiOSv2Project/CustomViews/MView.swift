//
//  MView.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 15/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import UIKit

@IBDesignable
class MView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            setShadowLayer()
        }
    }
    @IBInspectable var shadowColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) {
        didSet{
            layer.shadowColor = shadowColor.cgColor
            setShadowLayer()
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0){
        didSet{
            layer.shadowOffset = shadowOffset
            setShadowLayer()
        }
    }
    @IBInspectable var shadowOpacity: Float = 1{
        didSet{
            layer.shadowOpacity = shadowOpacity
            setShadowLayer()
        }
    }
    
    func setShadowLayer(){
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadowLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setShadowLayer()
    }
}
