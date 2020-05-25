import Foundation
import UIKit

/**
 This UITableView extension depends from: NSObject+Extension.swift and NSString+Extension.swift files to work properly
 
 For register and dequeue work properly xib and class must have the same name.
 
 Usage:
 register: tableView.register(cellType: <Name of class>.self)
 dequeue: tableView.dequeueReusableCell()
 */

extension UITableView {
    
    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.nameOfClass
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    public func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type,
                                                             for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: type.nameOfClass, for: indexPath) as? T else {
            "Could not dequeue cell with type: \(type). Returning empty cell".errorLog()
            return T()
        }
        
       return cell
    }
}
