//
//  MButton.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import UIKit

class MButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            //            layer.cornerRadius = cornerRadius
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
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadowLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setShadowLayer()
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
