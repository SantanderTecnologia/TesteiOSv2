//
//  StatmentHeaderView.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

typealias LogoutButtonHandler = (() -> Void)

class StatmentHeaderView: View {
    
    private var mainStackView: UIStackView!
    
    private var topStackView: UIStackView!
    private var nameLabel: UILabel!
    private var logoutButton: UIButton!
    
    private var accountStackView: UIStackView!
    private var accountLabel: UILabel!
    private var accountValueLabel: UILabel!
    
    private var balanceStackView: UIStackView!
    private var balanceLabel: UILabel!
    private var balanceValueLabel: UILabel!
    
    var handler: LogoutButtonHandler?
    
    override func prepareViews() {
        mainStackView = .init()
        
        topStackView = .init()
        nameLabel = .init()
        logoutButton = .init()
        
        accountStackView = .init()
        accountLabel = .init()
        accountValueLabel = .init()
        
        balanceStackView = .init()
        balanceLabel = .init()
        balanceValueLabel = .init()
    }
    
    override func addViewHierarchy() {
        topStackView.addArrangedSubviews([
            nameLabel,
            logoutButton
        ])
        
        accountStackView.addArrangedSubviews([
            accountLabel,
            accountValueLabel
        ])
        
        balanceStackView.addArrangedSubviews([
            balanceLabel,
            balanceValueLabel
        ])
        
        mainStackView.addArrangedSubviews([
            topStackView,
            accountStackView,
            balanceStackView
        ])
        
        addSubview(mainStackView)
    }
    
    override func setupConstraints() {
        logoutButton.snp.makeConstraints { make in
            make.size.equalTo(27)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview().inset(16)
        }
    }
    
    override func configureViews() {
        backgroundColor = Constants.Palette.defaultColor
        configureMainStackView()
        configureTopStackView()
        configureAccountStackView()
        configureBalanceStackView()
        configureLabels()
        configureLogouButton()
    }
    
    private func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 25
    }
    
    private func configureTopStackView() {
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .equalSpacing
        topStackView.spacing = 6
    }
    
    private func configureAccountStackView() {
        accountStackView.axis = .vertical
        accountStackView.alignment = .leading
        accountStackView.distribution = .fill
        accountStackView.spacing = 6
    }
    
    private func configureBalanceStackView() {
        balanceStackView.axis = .vertical
        balanceStackView.alignment = .leading
        balanceStackView.distribution = .fill
        balanceStackView.spacing = 6
    }
    
    private func configureLabels() {
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 25.0, weight: .light)
        nameLabel.textColor = .white
        
        accountLabel.text = Strings.Statment.Header.accountLabel
        accountLabel.textAlignment = .left
        accountLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        accountLabel.textColor = .white
        
        accountValueLabel.textAlignment = .left
        accountValueLabel.font = .systemFont(ofSize: 25.0, weight: .light)
        accountValueLabel.textColor = .white
        
        balanceLabel.text = Strings.Statment.Header.balanceLabel
        balanceLabel.textAlignment = .left
        balanceLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        balanceLabel.textColor = .white
        
        balanceValueLabel.textAlignment = .left
        balanceValueLabel.font = .systemFont(ofSize: 25.0, weight: .light)
        balanceValueLabel.textColor = .white
    }
    
    private func configureLogouButton() {
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.contentMode = .scaleAspectFit
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped(_ :)), for: .touchUpInside)
    }
    
    @objc private func logoutButtonTapped(_ sender: UIButton) {
        handler?()
    }
}

extension StatmentHeaderView {
    func set(vm: AccountDetail.TableViewModel.Section, handler: LogoutButtonHandler? = nil) {
        nameLabel.text = vm.name
        accountValueLabel.text = vm.account
        balanceValueLabel.text = vm.balance
        self.handler = handler
    }
}
