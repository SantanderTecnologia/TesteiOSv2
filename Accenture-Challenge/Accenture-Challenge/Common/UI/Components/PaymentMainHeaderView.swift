//
//  PaymentMainHeaderView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class PaymentMainHeaderView: UIView {
    
    private unowned var logOutButton: UIButton
    
    private lazy var nameLbl: UILabel = { return UILabel(frame: .zero) }()
    private lazy var accountFixedLbl: UILabel = { return UILabel(frame: .zero) }()
    private lazy var accountLbl: UILabel = { return UILabel(frame: .zero) }()
    private lazy var balanceFixedLbl: UILabel = { return UILabel(frame: .zero) }()
    private lazy var balanceLbl: UILabel = { return UILabel(frame: .zero) }()
    
    private var viewModel: Payments.Info.ViewModel.UserAccount?
    
    init(frame: CGRect,
         logOutButton: UIButton) {
        self.logOutButton = logOutButton
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: Payments.Info.ViewModel.UserAccount) {
        self.viewModel = viewModel
        applyViewCode()
    }
}

extension PaymentMainHeaderView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(logOutButton)
        addSubview(nameLbl)
        addSubview(accountFixedLbl)
        addSubview(accountLbl)
        addSubview(balanceFixedLbl)
        addSubview(balanceLbl)
    }
    
    func setupConstraints() {
        logOutButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(13)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        nameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(29)
            make.width.equalTo(215)
        }
        accountFixedLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom).offset(28)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(13)
            make.width.equalTo(47)
        }
        accountLbl.snp.makeConstraints { make in
            make.top.equalTo(accountFixedLbl.snp.bottom).offset(6)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(29)
            make.width.equalTo(300)
        }
        balanceFixedLbl.snp.makeConstraints { make in
            make.top.equalTo(accountLbl.snp.bottom).offset(21)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(13)
            make.width.equalTo(47)
        }
        balanceLbl.snp.makeConstraints { make in
            make.top.equalTo(balanceFixedLbl.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(29)
            make.width.equalTo(184)
        }
    }
    
    func configureViews() {
        backgroundColor = UIColor(rgb: 0x3b49ee)
        
        guard let viewModel = viewModel else { return }
        
        nameLbl.text = viewModel.name
        nameLbl.textColor = .white
        nameLbl.textAlignment = .left
        nameLbl.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        logOutButton.setImage(UIImage(named: "logout 2"), for: .normal)
        logOutButton.imageView?.contentMode = .scaleAspectFit
        
        accountFixedLbl.textAlignment = .left
        accountFixedLbl.text = "Conta"
        accountFixedLbl.textColor = .white
        accountFixedLbl.font = UIFont(name: "HelveticaNeue", size: 12)
        
        accountLbl.textAlignment = .left
        accountLbl.text = viewModel.accountInfo
        accountLbl.textColor = .white
        accountLbl.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        balanceFixedLbl.textAlignment = .left
        balanceFixedLbl.text = "Saldo"
        balanceFixedLbl.textColor = .white
        balanceFixedLbl.font = UIFont(name: "HelveticaNeue", size: 12)
        
        balanceLbl.textAlignment = .left
        balanceLbl.text = viewModel.balance
        balanceLbl.textColor = .white
        balanceLbl.font = UIFont(name: "HelveticaNeue-Light", size: 25)
    }
}
