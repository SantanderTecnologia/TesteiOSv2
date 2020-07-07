//
//  PaymentsSection.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsSection: BaseSection {
    
    override func heightForHeader() -> CGFloat {
        return 42
    }
    
    override func headerView() -> UIView? {
        return PaymentListHeaderView(frame: .zero)
    }
}
