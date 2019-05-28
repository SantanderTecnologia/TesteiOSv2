//
//  StatmentViewCell.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 23/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import UIKit

class StatmentViewCell: UITableViewCell {
    lazy var shadowView: ShadowView = {
        var cell = ShadowView()
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    lazy var view: UIView = {
        var v = UIView()
        v.backgroundColor = .white
        v.layer.shadowRadius = 2
        v.layer.masksToBounds = false
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var title: UILabel = {
        var v = UILabel()
        v.text = "text"
        v.textColor = UIColor(rgb: 0xA8B4C4)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var date: UILabel = {
        var v = UILabel()
        v.textColor = UIColor(rgb: 0xA8B4C4)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var desc: UILabel = {
        var v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var value: UILabel = {
        var v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func activateConstraints(_ constraints: [NSLayoutConstraint]){
        NSLayoutConstraint.activate(constraints)
    }
    
    func shadowViewConstraints(){
        addSubview(shadowView)
        let constraints = [shadowView.leftAnchor.constraint(equalTo: leftAnchor),
                           shadowView.topAnchor.constraint(equalTo: topAnchor),
                           shadowView.rightAnchor.constraint(equalTo: rightAnchor),
                           shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)]
        activateConstraints(constraints)
        
        //view.dropShadow()
        
    }
    
    func viewConstraints(){
        shadowView.addSubview(view)
        let constraints = [view.leftAnchor.constraint(equalTo: shadowView.leftAnchor, constant: 1),
                           view.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 1),
                           view.rightAnchor.constraint(equalTo: shadowView.rightAnchor, constant: -1),
                           view.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -1)]
        activateConstraints(constraints)
        
        
    }
    
    func titleConstraints(){
        view.addSubview(title)
        let constraints = [title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
                           title.topAnchor.constraint(equalTo: view.topAnchor, constant: 12)]
        activateConstraints(constraints)
    }
    
    func dateConstraints(){
        view.addSubview(date)
        let constraints = [date.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
                           date.topAnchor.constraint(equalTo: view.topAnchor, constant: 12)]
        activateConstraints(constraints)
    }
    
    func descConstraints(){
        view.addSubview(desc)
        let constraints = [desc.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
                           desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
                           desc.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12)]
        activateConstraints(constraints)
    }
    
    func valueConstraints(){
        view.addSubview(value)
        let constraints = [value.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat(-10)),
                           value.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 15),
                           value.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(-12))]
        activateConstraints(constraints)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        shadowViewConstraints()
        viewConstraints()
        titleConstraints()
        dateConstraints()
        descConstraints()
        valueConstraints()
        //backgroundColor = .black
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetStatment(statment: Statment) {
        title.text = statment.title
        date.text = statment.date
        desc.text = statment.desc
        value.text = statment.value
    }
}

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.08
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 2, height: 2)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
