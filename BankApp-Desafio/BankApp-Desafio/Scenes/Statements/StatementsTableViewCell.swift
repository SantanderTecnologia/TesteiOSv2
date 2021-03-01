//
//  StatementsTableViewCell.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
    
    //MARK: Properties - Cell
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()
    
    lazy var primaryStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    lazy var secondaryStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .trailing
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Pagamento"
        label.font = UIFont(name: "Helvetica Neue", size: 18.0)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Descrição"
        label.font = UIFont(name: "Helvetica Neue", size: 18.0)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "00/00/0000"
        label.font = UIFont(name: "Helvetica Neue", size: 14.0)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "R$ 0.000,00"
        label.font = UIFont(name: "Helvetica Neue", size: 23.0)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Cell.Style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    func setupView() {
        self.backgroundColor = .secondaryWhite()
        setupViewHierarchy()
        setupConstraints()
    }
        
    func setupViewHierarchy() {
        contentView.addSubview(cardView)
        cardView.addSubview(primaryStackView)
        cardView.addSubview(secondaryStackView)
        primaryStackView.addArrangedSubview(titleLabel)
        primaryStackView.addArrangedSubview(descriptionLabel)
        secondaryStackView.addArrangedSubview(dateLabel)
        secondaryStackView.addArrangedSubview(valueLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([

            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            primaryStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            primaryStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            primaryStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -14),
            
            secondaryStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            secondaryStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            secondaryStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -14)
        ])
    }
    
    func configure(with viewModel: Statements.StatementViewModel.Statement) {
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.dateLabel.text = viewModel.date
        self.valueLabel.text = viewModel.value
    }
}
