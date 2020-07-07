//
//  PaymentsView.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsView: UIView {
    
    private unowned var headerView: PaymentMainHeaderView
    private unowned var tableView: UITableView
    
    private lazy var errorView: UIView = {
        return UIView(frame: .zero)
    }()
    
    private lazy var errorLbl: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    var errorMessage: String? {
        didSet {
            if errorMessage != nil {
                errorView.isHidden = false
                errorLbl.text = errorMessage
            } else {
                errorView.isHidden = true
            }
        }
    }
    
    init(frame: CGRect,
         headerView: PaymentMainHeaderView,
         tableView: UITableView) {
        self.headerView = headerView
        self.tableView = tableView
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PaymentsView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        errorView.addSubview(errorLbl)
        addSubview(headerView)
        addSubview(tableView)
        addSubview(errorView)
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(232)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        errorLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalTo(tableView)
        }
    }
    
    func configureViews() {
        backgroundColor = Payments.Constants.Colors.backgroundColor
        errorView.backgroundColor = .white
        errorView.isHidden = true
        
        tableView.bounces = false
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}
