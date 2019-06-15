//
//  AccountStatementModel.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

struct AccountStatementModel {
    let title : String
    let desc : String
    let date : String
    let value: String
    
    /**
     Initiate AccountStatementModel.
     
     - parameters:
     - statement: Statement.
     */
    init(statement: Statement){
        title = statement.title
        desc = statement.desc
        date = AccountStatementModel.getDateString(by: statement.date)
        value = MonetaryString.getValueFormmater(value: statement.value)
    }
    /**
     Returns accountBank date formater.
     
     - parameters:
     - dateString: String.
     */
    static func getDateString(by dateString: String) -> String{
        let date = dateString.toDate()
        let dateFinalFormat = date.toString(dateFormat: "dd/MM/yyyy")
        return dateFinalFormat
    }
}
