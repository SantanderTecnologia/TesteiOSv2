//
//  StatementsDataSouce.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 16/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import UIKit

class StatementsDataSource: NSObject, UITableViewDataSource{
    
    var statements: [StatementsData]
    
    init(statements: [StatementsData]) {
        self.statements = statements
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatementsTableViewCell", for: indexPath) as? StatementsTableViewCell else{
            return UITableViewCell()
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        let date = dateFormatterGet.date(from: "\(statements[indexPath.row].date)")
        cell.selectionStyle = .none
        
        cell.paymentName.text = statements[indexPath.row].desc
        cell.money.text = statements[indexPath.row].value
        cell.paymentType.text = statements[indexPath.row].title
        cell.dateLabel.text = dateFormatterPrint.string(from: date!)
        
        return cell
     
    }
    
    
}
