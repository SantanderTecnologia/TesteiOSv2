//
//  StatementTableViewCell.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    
    static let identifier: String = "StatementTableViewCell"
    static let cellHeight: CGFloat = 104.0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        selectionStyle = .none
        
        dateLabel.textColor = .appGray
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = .appGray
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.textColor = .appBlack
        valueLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        descriptionLabel.textColor = .appBlack
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        cellContentView.setShadow(color: UIColor.appLightGrayShadow, offset: CGSize(width: 0, height: 4))
        cellContentView.layer.cornerRadius = 4.0
        cellContentView.layer.borderWidth = 1.0
        cellContentView.layer.borderColor = UIColor.appLightGray.cgColor
    }
    
    func setup(withViewModel viewModel: AccountDetails.FetchStatements.ViewModel.DisplayedStatement) {
        
        dateLabel.text = viewModel.date
        valueLabel.text = viewModel.value
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.desc
    }
    
}
