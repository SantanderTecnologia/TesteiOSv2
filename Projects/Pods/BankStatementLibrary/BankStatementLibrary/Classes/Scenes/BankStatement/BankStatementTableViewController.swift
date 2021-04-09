//
//  BankStatementTableViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 02/04/21.
//

import UIKit
import WorkersLibrary

extension BankStatementViewController: UITableViewDataSource, UITableViewDelegate
{
      
      public func numberOfSections(in tableView: UITableView) -> Int
      {
            return 2
      }
      
      public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section
            {
            case 0:
                  return 1
                  
            case 1:
                  if userWSStatementListCount == 0
                  {
                        return 1
                  }
                  else
                  {
                        return userWSStatementListCount
                  }
 
            default:
                  return 0
            }
      }
 
      public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
            let totalStatementTableViewCell = bankStatementTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.TotalStatementTableViewCell.rawValue) as! TotalStatementTableViewCell
            
            let statementTableViewCell = bankStatementTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.StatementTableViewCell.rawValue) as! StatementTableViewCell

            switch (indexPath.section, indexPath.row)
            {
            case (0,0):
                  totalStatementTableViewCell.selectionStyle = .none
                  totalStatementTableViewCell.backgroundColor = uiColorApp
                  
                  if userWSLogin != nil
                  {
                        totalStatementTableViewCell.nameLbL.text = (userWSLogin?.userAccount.name)!
                        totalStatementTableViewCell.accountNumberLbL.text = (userWSLogin?.userAccount.bankAccount)! + " / " + (userWSLogin?.userAccount.agency)!
                        
                        let balance = (userWSLogin?.userAccount.balance)!
                        let balanceString = Value.parseCurrency2Real(balance)
                        
                        var balanceColor = uiColorBlack
                        if balance < 0
                        {
                              balanceColor = uiColorRed
                        }
                        totalStatementTableViewCell.balanceLbL.textColor = balanceColor
                        
                        totalStatementTableViewCell.balanceLbL.text = balanceString
                  }
                                    
                  totalStatementTableViewCell.logoutBtN
                        .rx
                        .tap.do(onNext:  { [unowned self] in
                              logoutAndResetDataAction()
                        }).subscribe(onNext: { [unowned self] in
                            dismissVC()
                        }).disposed(by: disposeBag)
                  
                  self.totalStatementTableViewCell = totalStatementTableViewCell
                                                      
                  return totalStatementTableViewCell
                  
            default:
                  statementTableViewCell.selectionStyle = .none
                  statementTableViewCell.backgroundColor = uiColorWhite
                  
                  if userWSStatementListCount != 0
                  {
                        statementTableViewCell.titleLbL.text = (userWSStatementList?.statementList[indexPath.row].title)!
                        statementTableViewCell.dateLbL.text = (userWSStatementList?.statementList[indexPath.row].date)!
                        statementTableViewCell.descriptionLbL.text = (userWSStatementList?.statementList[indexPath.row].desc)!
                        
                        let value = (userWSStatementList?.statementList[indexPath.row].value)!
                        let valueString = Value.parseCurrency2Real(value)
                        
                        var valueColor = uiColorBlack
                        if value < 0
                        {
                              valueColor = uiColorRed
                        }
                        statementTableViewCell.valueLbL.textColor = valueColor
                        statementTableViewCell.valueLbL.text = valueString
                  } 

                  return statementTableViewCell
            }
      }
      
      public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
      {
            let headerStatementTableViewCell = bankStatementTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.HeaderStatementTableViewCell.rawValue) as! HeaderStatementTableViewCell

            if section == 1
            {
                  let headerView = UIView()
                  headerView.backgroundColor = uiColorWhite
                  headerView.addSubview(headerStatementTableViewCell)

                  return headerView
            }

            return UIView()
          }

      public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
      {
            if section == 1
            {
                  return 66.0
            }

            return 0.0
      }

      public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
            switch indexPath.section
            {
            case 0:
                  return 222.0
                  
            default:
                  return 99.9
            }
      }
                  
}
