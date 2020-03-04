//
//  StatementTableViewCell.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    static let identifier = "StatementTableViewCell"

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var dateTransactionLabel: UILabel!
    @IBOutlet private var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func set(viewModel: Account.ViewModel) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.dateTransactionLabel.text = viewModel.dateTransaction
        self.valueLabel.text = viewModel.value
    }
}
