//
//  BankStatementViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

class BankStatementViewController: UIViewController
{
      
      var totalStatementTableViewCell : TotalStatementTableViewCell?
      
      fileprivate var bankStatementTableView: UITableView!
      {
            didSet
            {
                  bankStatementTableView.delegate = self
                  bankStatementTableView.dataSource = self
                  
                  bankStatementTableView.tableFooterView = UIView(frame: CGRect.zero)
                  bankStatementTableView.tag = 202
                  
                  view.addSubview(bankStatementTableView)
            }
      }
      
      override func viewDidLoad()
      {
            super.viewDidLoad()
            
            initViewDidLoad()
            registerCells()
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            bankStatementTableView.frame = view.bounds
      }
      
      func initViewDidLoad()
      {
            self.navigationController?.isNavigationBarHidden = true
            
            bankStatementTableView = UITableView(frame: CGRect.zero, style: .grouped)
            bankStatementTableView.separatorStyle = .none
            bankStatementTableView.backgroundColor = uiColorApp
      }
      
      func registerCells()
      {
            self.bankStatementTableView.register(UINib(nibName: "TotalStatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.TotalStatementTableViewCell.rawValue)
            
            self.bankStatementTableView.register(UINib(nibName: "HeaderStatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.HeaderStatementTableViewCell.rawValue)
            self.bankStatementTableView.register(UINib(nibName: "StatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.StatementTableViewCell.rawValue)
      }
      
      func dismissVC()
      {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
      }
      
}

extension BankStatementViewController: UITableViewDataSource, UITableViewDelegate
{
      
      func numberOfSections(in tableView: UITableView) -> Int
      {
            return 2
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section
            {
            case 0:
                  return 1
                  
            case 1:
                  return 9
 
            default:
                  return 0
            }
      }
 
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
            let totalStatementTableViewCell = bankStatementTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.TotalStatementTableViewCell.rawValue) as! TotalStatementTableViewCell
            
            let statementTableViewCell = bankStatementTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.StatementTableViewCell.rawValue) as! StatementTableViewCell

            switch (indexPath.section, indexPath.row)
            {
            case (0,0):
                  totalStatementTableViewCell.selectionStyle = .none
                  totalStatementTableViewCell.backgroundColor = uiColorApp
                  
                  totalStatementTableViewCell.delegate = self
                  
                  self.totalStatementTableViewCell = totalStatementTableViewCell
                                                      
                  return totalStatementTableViewCell
                  
            default:
                  statementTableViewCell.selectionStyle = .none
                  statementTableViewCell.backgroundColor = uiColorWhite
                                                      
                  return statementTableViewCell

            }
      }
      
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
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

      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
      {
            if section == 1
            {
                  return 66.0
            }

            return 0.0
      }

      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
            switch indexPath.section
            {
            case 0:
                  return 222.0
                  
            default:
                  return 100.0
            }
      }
      
 
            
}

extension BankStatementViewController: TotalStatementTableViewCellDelegate
{
      func logoutTotalStatementTableViewCellAction()
      {
            dismissVC()
      }
}

