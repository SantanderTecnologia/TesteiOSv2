//
//  UITableView.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    ///Register a cell with his Default name and identifier on the main bundle. You must have created the corresponding nib
    func registerNib<T: UITableViewCell>(cellClass: T.Type) {
        self.register(UINib(nibName: T.defaultIdentifier, bundle: Bundle.main), forCellReuseIdentifier: T.defaultIdentifier)
    }
    
    ///Register a cell with his Default name and identifier on the main bundle.
    private func registerCell<T: UITableViewCell>(cellClass: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.defaultIdentifier)
    }
    
    ///Dequeue a cell with his default Class Name. Example: MyCustomCell.self
    func dequeue<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        return self.dequeue(withIdentifier: cellClass.defaultIdentifier, indexPath: indexPath)
    }
    
    ///Dequeue a cell with automatic casting
    private func dequeue<T: UITableViewCell>(withIdentifier id: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
}
