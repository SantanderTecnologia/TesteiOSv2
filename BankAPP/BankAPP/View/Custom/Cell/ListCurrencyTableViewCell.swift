//
//  ListCurrencyTableViewCell.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 13/07/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit

class ListCurrencyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ListCurrencyTableViewCell"
    
    lazy var viewCell: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.colorBorder.cgColor
        v.layer.cornerRadius = 6
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelTitle: UILabel = {
        let v = UILabel(frame: .zero)
        v.font = UIFont().fontAppDefault(size: 16)
        v.textAlignment = .left
        v.textColor = UIColor.colorLightGray
        v.text = "Pagamento"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelTitleContent: UILabel = {
        let v = UILabel(frame: .zero)
        v.font = UIFont().fontAppDefault(size: 16)
        v.textAlignment = .left
        v.textColor = UIColor.colorDarkBlue
        v.text = "Conta de Luz"
        v.adjustsFontSizeToFitWidth = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelDate: UILabel = {
        let v = UILabel(frame: .zero)
        v.font = UIFont().fontAppDefault(size: 12)
        v.textAlignment = .right
        v.textColor = UIColor.colorLightGray
        v.text = "12/12/2018"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var labelValue: UILabel = {
        let v = UILabel(frame: .zero)
        v.font = UIFont().fontAppLight(size: 20)
        v.textAlignment = .right
        v.adjustsFontSizeToFitWidth = true
        v.text = "R$1.000,00"
        v.textColor = UIColor.colorDarkBlue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayoutUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayoutUI() {
        backgroundColor = .white
        addSubview(viewCell)
        addSubview(labelTitle)
        addSubview(labelTitleContent)
        addSubview(labelDate)
        addSubview(labelValue)
        
        
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            viewCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 2),
            viewCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -2),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelTitle.widthAnchor.constraint(equalToConstant: 180)
        ])
        NSLayoutConstraint.activate([
            labelTitleContent.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 18),
            labelTitleContent.leftAnchor.constraint(equalTo: labelTitle.leftAnchor, constant: 0),
            labelTitleContent.widthAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            labelDate.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelDate.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            labelDate.leftAnchor.constraint(equalTo: labelTitle.rightAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            labelValue.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 16),
            labelValue.rightAnchor.constraint(equalTo: labelDate.rightAnchor, constant: 0),
            labelValue.leftAnchor.constraint(equalTo: labelTitleContent.rightAnchor, constant: 10)
        ])
    }
    
    func statementsContent(infoStatement: StatementList?) {
        guard let statement = infoStatement else {
            labelTitle.text = "Pagamento"
            labelDate.text = "00/00/0000"
            labelValue.text = "R$ 100,00"
            labelTitleContent.text = "Conta de Luz"
            return
        }
        labelTitle.text = statement.title
        labelDate.text = statement.date
        labelValue.text = "R$ "+String(format: "%0.2f", statement.value)
        labelTitleContent.text = statement.desc
    }
}
