//
//  StatementListCell.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

class StatementListCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak private(set) var contentViewBorder: UIView!
    @IBOutlet weak private(set) var dateLabel: UILabel!
    @IBOutlet weak private(set) var paymentDescription: UILabel!
    @IBOutlet weak private(set) var paymentValue: UILabel!

    // MARK: - Setup

    func configure(with data: StatementModel) {
        contentViewBorder.addDropShadow(color: UIColor(hex: "#A8B4C4", default: .darkGray),
                                        offset: CGSize(width: 1, height: 1),
                                        radius: 2,
                                        opacity: 1)
        dateLabel.text = data.date
        paymentDescription.text = data.desc
        paymentValue.text = data.value.asCurrency() ?? ""
    }

}
