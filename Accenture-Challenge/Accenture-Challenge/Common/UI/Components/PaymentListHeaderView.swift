//
//  PaymentHeaderView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

class PaymentListHeaderView: UIView {
    
    private lazy var headerLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PaymentListHeaderView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(headerLbl)
    }
    
    func setupConstraints() {
        headerLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.left.equalToSuperview().inset(18)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
    }
    
    func configureViews() {
        backgroundColor = .white
        
        headerLbl.text = "Recentes"
        headerLbl.textAlignment = .left
        headerLbl.font = UIFont(name: "HelveticaNeue", size: 17)
        headerLbl.textColor = UIColor(rgb: 0x485465)
    }
}
