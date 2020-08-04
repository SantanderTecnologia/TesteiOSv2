//
//  TransactionCell.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet private(set) weak var transferType: UILabel!
    @IBOutlet private(set) weak var transferName: UILabel!
    @IBOutlet private(set) weak var transferDate: UILabel!
    @IBOutlet private(set) weak var transferValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        contentView.frame = contentView.frame.inset(by: padding)
        addShadow()
    }
    
    private func addShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.12
        contentView.layer.shadowOffset = .zero
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = false
    }
    
    func setup(model: TimelineModel) {
        transferType.text = model.title
        transferName.text = model.desc
        transferDate.text = model.date.getFullDate()?.getStringFullDate()
        transferValue.text = model.value.getMoneyFormat()
    }
    
}
