//
//  extBankStatementViewController.swift
//  BankStatementLibrary
//
//  Created by LeandroLee on 09/04/21.
//

import Foundation
import WorkersLibrary

extension BankStatementViewController
{
      
      public func logoutAndResetDataAction()
      {
            userEmailOrCPF = ""
            userPassword = ""
            
            userWSLogin = nil
            
            userWSStatementList = nil
            userWSStatementListCount = 0
      }
      
      public func dismissVC()
      {
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
      }
      
}
