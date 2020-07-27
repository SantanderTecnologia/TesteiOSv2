//
//  UITableViewExtension.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, indexPath: IndexPath? = nil) -> T {
        guard let index = indexPath else {
            guard let cell = dequeueReusableCell(withIdentifier: String(describing: cell)) as? T else {
                fatalError("dequeueReusableCell failure")
            }
            return cell
        }
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cell), for: index) as? T else {
            fatalError("dequeueReusableCell failure")
        }
        return cell
    }
}

