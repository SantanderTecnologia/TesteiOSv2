//
//  AccountView.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Domain
import Presenter

public protocol AccountViewDelegate: AnyObject {
    func didTapLogoutButon()
}

public class AccountView: CustomView {
    
    // MARK: - PRIVATE PROPERTIES
       
    private let userAccount: UserAccountModel
    private let delegate: AccountViewDelegate
    
    // MARK: - CONSTANTS
    
    private struct Metrics {
        static let margin: CGFloat = 20
        static let spacingInStackViews: CGFloat = 6
    }
    
    private struct Strings {
        static let account = "Conta"
        static let balance = "Saldo"
    }
    
    // MARK: - UI

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = userAccount.name
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var accountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Metrics.spacingInStackViews
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var accoutTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.account
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var accoutNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(userAccount.bankAccount) / \(userAccount.agency.bankFormated)"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var balanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Metrics.spacingInStackViews
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var balanceTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.balance
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var balanceNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NumberFormatter.balanceAttString(with: Decimal(userAccount.balance), and: (symbolColor: UIColor.systemGray2, textColor: UIColor.white, fontSize: 25))
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        let configurationImage = UIImage.SymbolConfiguration(weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right.to.line", withConfiguration: configurationImage), for: .normal)
        button.imageView?.tintColor = .white
        button.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - INITALIZER
    
    public init(userAccount: UserAccountModel, delegate: AccountViewDelegate) {
        self.userAccount = userAccount
        self.delegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
        addSubview(nameLabel)
        addSubview(accountStackView)
        accountStackView.addArrangedSubview(accoutTextLabel)
        accountStackView.addArrangedSubview(accoutNumberLabel)
        addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceTextLabel)
        balanceStackView.addArrangedSubview(balanceNumberLabel)
        addSubview(logoutButton)
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.margin * 2),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.margin),
            nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: logoutButton.leadingAnchor, constant: -Metrics.margin),
            
            logoutButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.margin),
            
            accountStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metrics.margin),
            accountStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.margin),
            accountStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.margin),
            
            balanceStackView.topAnchor.constraint(equalTo: accountStackView.bottomAnchor, constant: Metrics.margin),
            balanceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.margin),
            balanceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.margin),
            balanceStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.margin)
        ])
    }
    
    public func style() {
        backgroundColor = .init(red: 0.23, green: 0.20, blue: 0.93, alpha: 1.0)
    }
    
    // MARK: - PRIVATE FUNC
    
    @objc
    private func logoutButtonDidTap() {
        delegate.didTapLogoutButon()
    }
}
