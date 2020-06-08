//
//  TransactionCustomCell.swift
//  UserInterface
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Presenter

public class TransactionCustomCell: CustomTableViewCell {

    // MARK: - CONSTANTS
    
    private struct Metrics {
        static let margin: CGFloat = 16
        static let cornerRadius: CGFloat = 6
        static let shadowOffset: CGSize = . init(width: 0, height: 0)
        static let shadowOpacity: Float = 0.10
    }
    
    // MARK: - UI
    
    private lazy var contentCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = Metrics.cornerRadius
        view.layer.shadowOffset = Metrics.shadowOffset
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = Metrics.shadowOpacity
        return view
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = Metrics.margin
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Metrics.margin
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - INITALIZER
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.dateLabel.text = nil
        self.valueLabel.text = nil
    }
    
    // MARK: - VIEW HIERARCHY
    
    public func subviews() {
        addSubview(contentCellView)
        contentCellView.addSubview(leftStackView)
        leftStackView.addArrangedSubview(titleLabel)
        leftStackView.addArrangedSubview(descriptionLabel)
        contentCellView.addSubview(rightStackView)
        rightStackView.addArrangedSubview(dateLabel)
        rightStackView.addArrangedSubview(valueLabel)
    }
    
    public func constraints() {
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.margin / 2),
            contentCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.margin),
            contentCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.margin),
            contentCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.margin / 2),
            
            leftStackView.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: Metrics.margin),
            leftStackView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: Metrics.margin),
            leftStackView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -Metrics.margin),
            
            rightStackView.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: Metrics.margin),
            rightStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leftStackView.trailingAnchor, constant: Metrics.margin),
            rightStackView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metrics.margin),
            rightStackView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -Metrics.margin),
        ])
    }
    
    public func style() {
        backgroundColor = .clear
    }
    
    // MARK: - PUBLIC FUNC
    
    public func update(with transaction: TransactionModel) {
        DispatchQueue.main.async {
            self.titleLabel.text = transaction.title
            self.descriptionLabel.text = transaction.description
            self.dateLabel.text = transaction.date.dateFormated
            self.valueLabel.attributedText = NumberFormatter.balanceAttString(with: Decimal(transaction.value),
                                                                              and: (symbolColor: .systemGray2,
                                                                                    textColor: .black,
                                                                                    fontSize: 20))
        }
    }
}
