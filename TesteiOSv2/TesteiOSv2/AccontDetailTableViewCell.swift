//
//  AccontDetailTableCell.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class AccontDetailTableViewCell : UITableViewCell{
    /**
     This view's cell view for the statements.
     */
    lazy var cellView : UIView = {
        let cellView = UIView()
        return cellView
    }()
    /**
     This view's title label for the statements.
     */
    lazy var title : UILabel = {
        let title = UILabel()
        title.font = UIFont.init(name: "HelveticaNeue-Light", size: 16)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.textColor = UIColor.init(red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    /**
     This view's descriptionAccount label for the statements.
     */
    lazy var descriptionAccount : UILabel = {
        let descriptionAccount = UILabel()
        descriptionAccount.font =  UIFont.init(name: "HelveticaNeue-Light", size: 16)
        descriptionAccount.numberOfLines = 0
        descriptionAccount.textAlignment = .center
        descriptionAccount.translatesAutoresizingMaskIntoConstraints = false
        return descriptionAccount
    }()
    
    /**
     This view's data label for the statements.
     */
    lazy var dataLabel : UILabel = {
        let dataLabel = UILabel()
        dataLabel.font =  UIFont.init(name: "HelveticaNeue-Light", size: 12)
        dataLabel.numberOfLines = 0
        dataLabel.textColor = UIColor.init(red: 168, green: 180, blue: 196, alpha: 1)
        dataLabel.textAlignment = .center
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        return dataLabel
    }()
    /**
     This view's value label for the statements.
     */
    lazy var value : UILabel = {
        let value = UILabel()
        value.font =  UIFont.init(name: "HelveticaNeue-Light", size: 20)
        value.numberOfLines = 0
        value.textAlignment = .center
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     Update this view labels.
     - parameters:
     - statement: AccountStatementModel
     */
    func uploadCell(with statement: AccountStatementModel){
        self.title.text = statement.title
        self.descriptionAccount.text = statement.desc
        self.dataLabel.text = statement.date
        self.value.text = statement.value
    }
}
extension AccontDetailTableViewCell : ViewCode{
    func buildViewHierarchy() {
        self.addSubview(cellView)
        self.addSubview(title)
        self.addSubview(dataLabel)
        self.addSubview(descriptionAccount)
        self.addSubview(value)
    }
    
    func setupConstraints() {
        self.cellView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(5)
        }
        self.title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(18)
        }
        self.descriptionAccount.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(title.snp.bottom).offset(19.2)
        }
        self.dataLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(32)
            make.top.equalToSuperview().offset(24)
        }
        
        self.value.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(13)
            make.right.equalToSuperview().inset(27)
        }

    }
    
    func setupAdditionalConfigurations() {
        cellView.layer.cornerRadius = 5
        cellView.backgroundColor = .white
        cellView.layer.shadowOffset = CGSize(width: 0, height: 5)
        cellView.layer.shadowRadius = 5
        cellView.layer.borderColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1).cgColor
        cellView.layer.borderWidth = 1
        cellView.layer.shadowOpacity = 0.05
        
    }
    
    
}
