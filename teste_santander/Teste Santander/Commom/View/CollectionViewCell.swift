//
//  CollectionViewCell.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var delegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func fromNib() -> CollectionViewCell? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CollectionViewCell
    }

}
protocol CollectionViewCellDelegate {
    func didTap()
}
