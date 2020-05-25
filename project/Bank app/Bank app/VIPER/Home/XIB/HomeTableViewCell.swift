//
//  HomeTableViewCell.swift
//  Bank app
//
//  Created by mmalaqui on 20/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(homeViewStatementModel : HomeViewStatementModel){
        self.titleLabel.text = homeViewStatementModel.title
        self.descriptionLabel.text = homeViewStatementModel.desc
        self.valueLabel.text = homeViewStatementModel.value
        self.dateLabel.text = homeViewStatementModel.date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: .zero, height: 10)
        layer.shadowRadius = 4
        layer.shadowColor = ((UIColor(named: "shadowColor") ?? UIColor.lightGray).cgColor)
    }
    
}
