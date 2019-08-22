//
//  InfoCell.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var itemType: UILabel!
    @IBOutlet weak var itemTittle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(statement: Statement) {
        itemType.text = statement.title
        itemTittle.text = statement.desc
        dateLabel.text = DateHelper.formatDate(string: statement.date)
        priceLabel.textColor = statement.value > 0 ? .plus : .less
        priceLabel.text = PriceFormatter.formatPrice(price: statement.value)
        infoView.addShadowInView()
    }
}
