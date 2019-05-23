//
//  StatementItemTableViewCell.swift
//  BankApp
//
//  Created by Pedro Danilo Ferreira Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class StatementItemTableViewCell: UITableViewCell {
    @IBOutlet weak var container: UIView! {
        didSet {
            container.rounded(radius: 4.0)
            container.addShadow(radius: 4.0)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
            titleLabel.textColor = .lightGray
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
            dateLabel.textColor = .lightGray
            dateLabel.textAlignment = .right
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            descriptionLabel.textColor = .gray
        }
    }
    @IBOutlet weak var valueLabel: UILabel! {
        didSet {
            valueLabel.font = UIFont.preferredFont(forTextStyle: .callout)
            valueLabel.textAlignment = .right
            valueLabel.textColor = .gray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .groupTableViewBackground
        selectionStyle = .none
    }

    func setup(info: StatementModel?) {
        guard let info = info else { return }
        titleLabel.text = info.title
        dateLabel.text = info.date.toDate
        descriptionLabel.text = info.desc
        valueLabel.text = info.value.toCurrency ?? ""
    }
    
}
