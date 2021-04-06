//
//  Extensions.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation
import UIKit

// MARK: - Extension for all view controllers.
extension UIViewController {
    /// Hides the title bar of `NavigationController`
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /// Shows the tite bar of `NavigationController`
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}

// MARK: - Extensions for ShowStatementViewController
// Extension for bar style configuration
extension ShowStatementsViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
     }
}


// Extension for delegate and datasource methods
extension ShowStatementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_ID, for: indexPath) as? StatementTableViewCell {
                        
            let currentStatement = self.statements[indexPath.section]
            cell.titleLabel.text = currentStatement.title
            cell.descriptionLabel.text = currentStatement.description
            cell.dateLabel.text = currentStatement.date
            cell.valueLabel.text = currentStatement.totalAmount
            
            cell.addEffects()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(16)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }            
}
    

