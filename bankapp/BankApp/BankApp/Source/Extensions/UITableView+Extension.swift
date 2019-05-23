//
//  UITableView+Extension.swift
//  BankApp
//
//  Created by Pedro Danilo Ferreira Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T:UITableViewCell>(as: T.Type) {
        let name = "\(T.self)"
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    func dequeueCell<T:UITableViewCell>(as: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        guard let cell = self.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T else { return nil }
        return cell
    }
}
