//
//  StatementCell.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class StatementCell: TableViewCell {
    
    private var containerView: UIView!
    private var mainStackView: UIStackView!
    
    private var firstStackView: UIStackView!
    private var typeLabel: UILabel!
    private var dateLabel: UILabel!
    
    private var secondStackView: UIStackView!
    private var descriptionLabel: UILabel!
    private var valueLabel: UILabel!
    
    override func prepareForReuse() {
        typeLabel.text = nil
        descriptionLabel.text = nil
        dateLabel.text = nil
        valueLabel.text = nil
    }
    
    override func prepareViews() {
        containerView = .init()
        mainStackView = .init()
        
        firstStackView = .init()
        typeLabel = .init()
        descriptionLabel = .init()
        
        secondStackView = .init()
        dateLabel = .init()
        valueLabel = .init()
    }
    
    override func addViewHierarchy() {
        firstStackView.addArrangedSubviews([
            typeLabel,
            dateLabel
        ])
        
        secondStackView.addArrangedSubviews([
            descriptionLabel,
            valueLabel
        ])
        
        mainStackView.addArrangedSubviews([
            firstStackView,
            secondStackView
        ])
        
        containerView.addSubview(mainStackView)
        contentView.addSubview(containerView)
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview().inset(10)
        }
    }
    
    override func configureViews() {
        selectionStyle = .none
        backgroundColor = Constants.Palette.extraLightGray
        containerView.backgroundColor = .white
        containerView.applyShadow()
        containerView.layer.cornerRadius = 6
        
        configureFirstStackView()
        configureSecondStackView()
        configureMainStackView()
        configureLabels()
    }
    
    //MARK: -
    //MARK: - CONFIGURE FIRST STACKVIEW
    private func configureFirstStackView() {
        firstStackView.axis = .horizontal
        firstStackView.alignment = .fill
        firstStackView.distribution = .equalSpacing
        firstStackView.spacing = 10
    }
    
    //MARK: -
    //MARK: - CONFIGURE SECOND STACKVIEW
    private func configureSecondStackView() {
        secondStackView.axis = .horizontal
        secondStackView.alignment = .fill
        secondStackView.distribution = .equalSpacing
        secondStackView.spacing = 10
    }
    
    //MARK: -
    //MARK: - CONFIGURE MAIN STACKVIEW
    private func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 13
    }
    
    //MARK: -
    //MARK: - CONFIGURE MAIN STACKVIEW
    private func configureLabels() {
        typeLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        typeLabel.textColor = .lightGray
        
        dateLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        dateLabel.textColor = .lightGray
        
        descriptionLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        
        valueLabel.font = .systemFont(ofSize: 20.0, weight: .light)
        
    }
}

extension StatementCell {
    func set(vm: AccountDetail.TableViewModel.Cell) {
        typeLabel.text = vm.type
        dateLabel.text = vm.date
        descriptionLabel.text = vm.description
        valueLabel.text = vm.value
    }
}
