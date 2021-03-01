//
//  LoadingView.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/28/21.
//

import UIKit

//MARK: LoadingView
class LoadingView: UIView {
    lazy var activityIndicador: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .whiteLarge
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .mediumGray()
        addSubview(activityIndicador)
    }
    
    private func setupConstraints() {
        activityIndicador.contraintAllEdges(to: self)
    }
    
    func show() {
        self.isHidden = false
        self.activityIndicador.startAnimating()
    }
    
    func hide() {
        self.isHidden = true
        self.activityIndicador.stopAnimating()
    }
}
