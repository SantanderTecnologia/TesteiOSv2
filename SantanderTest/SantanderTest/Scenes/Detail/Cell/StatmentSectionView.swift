//
//  StatmentSectionView.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit


class StatmentSectionView: View {
    
    private var label: UILabel!
    
    override func prepareViews() {
        label = .init()
    }
    
    override func addViewHierarchy() {
        addSubview(label)
    }
    
    override func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    override func configureViews() {
        backgroundColor = Constants.Palette.extraLightGray
        label.font = .systemFont(ofSize: 17.0, weight: .regular)
        label.textAlignment = .left
    }
    
    func set(text: String) {
        label.text = text
    }
}
