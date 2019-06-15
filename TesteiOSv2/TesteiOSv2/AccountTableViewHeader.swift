//
//  AccountTableViewHeader.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class AccountTableViewHeader : UIView{
    /**
     This header title label.
     */
    lazy var title : UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.numberOfLines = 0
        title.text = ACCOUNT_TABLEVIEW_HEADER_TITLE
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
}
extension AccountTableViewHeader : ViewCode{
    func buildViewHierarchy() {
        self.addSubview(title)
    }
    
    func setupConstraints() {
        self.title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    func setupAdditionalConfigurations() {
     self.backgroundColor = UIColor.red
    }
    
    
}
