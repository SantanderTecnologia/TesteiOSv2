//
//  GetLoginData.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 21/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

class getLoginData {
    

    func getData (user: String, password:String) -> LoginData {
        

        var intUsuario = "user=" + user
        var intSenha = "&password=" + password
        var statusCode = 500
        var agency = ""
        var balance = 0.00
        var account = ""
        var name = ""
        var userid = 0

        var returnData = LoginData(statusCode: statusCode, agency: agency, balance: balance, account: account, name: name, userid: userid)

        let headers = [
          "content-type": "application/x-www-form-urlencoded",
          "cache-control": "no-cache",
          "postman-token": "60853b97-c588-6034-d09b-921ec9bffbe1"
        ]
        let postData = NSMutableData(data: intUsuario.data(using: String.Encoding.utf8)!)
        postData.append(intSenha.data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://bank-app-test.herokuapp.com/api/login")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        

        let group = DispatchGroup()
        group.enter()
        

        var dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            

          } else {
            let httpResponse = response as? HTTPURLResponse
            statusCode = httpResponse!.statusCode
            

            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
               // print(responseJSON["userAccount"])
                if let dict = responseJSON["userAccount"] as? NSDictionary {
                            // Now reference the data you need using:
                           

                            agency = dict.value(forKey: "agency") as! (String)
                            balance = dict.value(forKey: "balance") as! (Double)
                            account = dict.value(forKey: "bankAccount") as! (String)
                            name = dict.value(forKey: "name") as! (String)
                            userid = dict.value(forKey: "userId") as! (Int)
                    

                   returnData = LoginData(statusCode: statusCode, agency: agency, balance: balance, account: account, name: name, userid: userid)
                    

                 }
            }
          }
            group.leave()
        })
        

        dataTask.resume()
        

        group.wait(timeout: DispatchTime.now() + 4)
return returnData
        

    }

    

}
