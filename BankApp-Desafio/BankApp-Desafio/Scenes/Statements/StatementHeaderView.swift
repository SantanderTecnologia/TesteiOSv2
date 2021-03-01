//
//  StatementHeaderView.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

protocol StatementHeaderViewDelegate: AnyObject {
    func didTapLogout()
}

class StatementHeaderView: UIView {
    
    //MARK: Properties
    private var user: UserAPIModel?
    weak var delegate: StatementHeaderViewDelegate?
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Nome do Usuário"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var agencyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Conta"
        label.font = UIFont(name: "Helvetica Neue", size: 12.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var agencyAccountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Conta do Usuário"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Saldo"
        label.font = UIFont(name: "Helvetica Neue", size: 12.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "R$00"
        label.font = UIFont(name: "Helvetica Neue", size: 25.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var logoutButton: UIButton = {
        let image = UIImage(named: "logout 2")
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tapLogout), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func tapLogout() {
        delegate?.didTapLogout()
    }
    
    //MARK: Init Header
    init() {
        super.init(frame: .zero)
        self.configureView()
        setupViewHierarchy()
        setupConstraints()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    func configureView(){
        self.backgroundColor = .mediumBlue()
        self.layer.shouldRasterize = true
    }
    
    func setupViewHierarchy() {
        addSubview(usernameLabel)
        addSubview(agencyLabel)
        addSubview(agencyAccountLabel)
        addSubview(balanceTitleLabel)
        addSubview(balanceValueLabel)
        addSubview(logoutButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            logoutButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.widthAnchor.constraint(equalToConstant: 40),
            
            usernameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            usernameLabel.trailingAnchor.constraint(equalTo: logoutButton.leadingAnchor, constant: -102),
            
            agencyLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 28),
            agencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            agencyAccountLabel.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 7),
            agencyAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            balanceTitleLabel.topAnchor.constraint(equalTo: agencyAccountLabel.bottomAnchor, constant: 21),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            balanceValueLabel.topAnchor.constraint(equalTo: balanceTitleLabel.bottomAnchor, constant: 7),
            balanceValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
        ])
    }
    
    func configure(with user: UserAccount?) {
        guard let user = user else { return }
        self.usernameLabel.text = user.name
        let agencyAccount = "\(user.agency) / \(user.bankAccount)"
        self.agencyAccountLabel.text = agencyAccount
        self.balanceValueLabel.text = user.balance.toCurrencyFormat()
    }
}
