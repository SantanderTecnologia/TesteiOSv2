//
//  StatementViewCell.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class StatementViewCell: CollectionViewCell {
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valuelabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant =  UIScreen.main.bounds.width - 16
        layoutIfNeeded()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        dateLabel.text = nil
        valuelabel.text = nil
        descLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.applySketchShadow(color: UIColor(red: 217 / 255, green: 226 / 255, blue: 233 / 255, alpha: 1), alpha: 0.5, x: 0, y: 5, blur: 12, spread: 0)
        self.layer.masksToBounds = false
        boxView.layer.cornerRadius = 5
        

    }
    
    func setup(display: StatementDisplay) {
        titleLabel.text = display.type
        descLabel.text = display.desc
        valuelabel.text = display.value
        dateLabel.text = display.date
        setNeedsLayout()
    }
}
