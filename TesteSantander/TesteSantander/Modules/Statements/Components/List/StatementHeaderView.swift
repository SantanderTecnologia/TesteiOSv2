//
//  HeaderView.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 31/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class StatementHeaderView: UIView {

    static let title = "Recentes"
    fileprivate var titleLabel: UILabel!
    
    func setup() {
        backgroundColor = UIColor.whiteTwo
        
        // TitleLabel
        titleLabel = UILabel()
        titleLabel.text = StatementHeaderView.title
        titleLabel.font = UIFont.helveticaNeue(size: 17)
        titleLabel.textColor = UIColor.slate
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(15.2)
        }
    }

}
