//
//  AlertManager.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 23/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import UIKit

class AlertHelper {

    private init(){}
    
    static func showOkAlert(context: UIViewController, title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: okAction)
        
        alert.addAction(action)
        
        context.present(alert, animated: true)
    }
    
    static func showYesNoAlert(context: UIViewController, title: String, message: String, yesAction: ((UIAlertAction) -> Void)? = nil, noAction: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let no = UIAlertAction(title: "Não", style: .default, handler: noAction)
        let yes = UIAlertAction(title: "Sim", style: .default, handler: yesAction)
        
        alert.addAction(no)
        alert.addAction(yes)
        
        context.present(alert, animated: true)
    }
    
}
