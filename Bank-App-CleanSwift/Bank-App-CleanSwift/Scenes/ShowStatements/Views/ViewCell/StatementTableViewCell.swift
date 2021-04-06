//
//  StatementTableViewCell.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 19/03/21.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    /// Adds some layout effects in cell
    func addEffects() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = CGFloat(1)
        layer.cornerRadius = CGFloat(10)
        clipsToBounds = false
                                
        layer.shadowRadius = CGFloat(10)
        layer.shadowOpacity = Float(0.2)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
