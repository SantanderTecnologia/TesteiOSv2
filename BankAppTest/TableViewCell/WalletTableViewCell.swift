//
//  WalletTableViewCell.swift
//  BankAppTest
//
//  Created by Ailton Lessa Silva on 5/18/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var desc: UILabel?
    @IBOutlet weak var date: UILabel?
    @IBOutlet weak var value: UILabel?
    
    func insertData(data: StatementList) {
        title?.text = data.title
        desc?.text = data.desc
        date?.text = data.date
        value?.text = "\(data.value)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        title?.text = nil
        desc?.text = nil
        date?.text = nil
        value?.text = nil
    }
}
