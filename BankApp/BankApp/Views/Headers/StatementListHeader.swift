//
//  StatementListHeader.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 18/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

class StatementListHeader: UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        
        contentView.backgroundColor = UIColor(hex: "FEFEFE", default: .green)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        titleLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        titleLabel.textColor = UIColor(hex: "#485465", default: .black)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
