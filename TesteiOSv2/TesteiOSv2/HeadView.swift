//
//  HeadView.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit
import SnapKit

class HeadView : UIView{
    /**
     This view's userName label.
     */
    lazy var userName : UILabel = {
        let userName = UILabel()
        userName.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        userName.numberOfLines = 0
        userName.textAlignment = .center
        userName.textColor = .white
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    /**
     This view's logOut button.
     */
    lazy var logoutButton : UIButton = {
        let logoutButton = UIButton()
        let img = UIImage(named: LOGOUT_IMAGE_NAME)
        logoutButton.setImage(img , for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(pressedAction), for: .touchUpInside)
        
        return logoutButton
    }()
    /**
     This view's accont title label.
     */
    lazy var accontLabel : UILabel = {
        let accontLabel = UILabel()
        accontLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 12)
        accontLabel.numberOfLines = 0
        accontLabel.textAlignment = .center
        accontLabel.text = "Conta"
        accontLabel.textColor = .white
        accontLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontLabel
    }()
    /**
     This view's account number label.
     */
    lazy var accontNumberLabel : UILabel = {
        let accontNumberLabel = UILabel()
        accontNumberLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        accontNumberLabel.numberOfLines = 0
        accontNumberLabel.textAlignment = .center
        accontNumberLabel.textColor = .white
        accontNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontNumberLabel
    }()
    /**
     This view's balance title label.
     */
    lazy var balanceLabel : UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 12)
        balanceLabel.numberOfLines = 0
        balanceLabel.textAlignment = .center
        balanceLabel.text = "Saldo"
        balanceLabel.textColor = .white
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        return balanceLabel
    }()
    /**
     This view's value label.
     */
    lazy var accontValueLabel : UILabel = {
        let accontValueLabel = UILabel()
        accontValueLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        accontValueLabel.numberOfLines = 0
        accontValueLabel.textAlignment = .center
        accontValueLabel.textColor = .white
        accontValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontValueLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pressedAction(sender: UIButton!) {
        guard let superView = self.parentViewController as? AccountDetailViewController else {
            return
            
        }
        superView.logOut()
        
    }
    
}
extension HeadView: ViewCode{
    func buildViewHierarchy() {
        self.addSubview(userName)
        self.addSubview(logoutButton)
        self.addSubview(accontLabel)
        self.addSubview(accontNumberLabel)
        self.addSubview(balanceLabel)
        self.addSubview(accontValueLabel)
    }
    
    func setupConstraints() {
        self.userName.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(18)
        }
        self.logoutButton.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.right.equalToSuperview().inset(13)
        }
        
        self.accontLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(28)
            make.left.equalTo(18)
        }
        
        self.accontNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(accontLabel.snp.bottom).offset(6)
            make.left.equalTo(18)
        }
        
        self.balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(accontNumberLabel.snp.bottom).offset(21)
            make.left.equalTo(18)
        }
        
        self.accontValueLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).offset(7)
            make.left.equalTo(18)
        }
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = UIColor.init(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)

    }
    
    
}
