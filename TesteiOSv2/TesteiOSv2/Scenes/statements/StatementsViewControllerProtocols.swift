//
//  StatementsViewControllerProtocols.swift
//  TesteiOSv2
//
//  Created by Foliveira on 12/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import UIKit

protocol StatementsViewControllerProtocol {
    func showUserData(data: [Statement])
}

extension StatementsViewController: StatementsViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    func showUserData(data: [Statement]) {
        statements = data
        StatementsTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return statements.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "StatementsCell", for: indexPath) as! StatementsTableViewCell
      
    cell.setupCell(statement: (statements[indexPath.row]))
      
      return cell
  }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 45))
        label.text = "Recentes"
        label.font = UIFont(name: "HelveticaNeue", size: 17)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        vw.addSubview(label)
        
        return vw
    }
}

