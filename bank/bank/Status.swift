//
//  Status.swift
//  bank
//
//  Created by mayara.da.s.andrade on 16/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import Foundation

struct StatusResponse: Codable {
    let status : [Status]
    
    enum CodingKeys: String, CodingKey {
        case status = "statementList"
        
        }
    }
struct Status: Codable{
    let title: String
    let desc: String
    let date: String
    let value: Double
    
    enum CodingKeys: String, CodingKey{
        case title
        case desc
        case date
        case value
    }
    
}

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


