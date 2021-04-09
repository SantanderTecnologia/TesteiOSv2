//
//  BankStatementViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import WorkersLibrary
import RxSwift
import RxCocoa

public
class BankStatementViewController: UIViewController
{
      public var totalStatementTableViewCell : TotalStatementTableViewCell?
      
      public let bankStatementViewModel = BankStatementViewModel()
      
      public let disposeBag = DisposeBag()
      
      public var bankStatementTableView: UITableView!
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
      
      public override func viewDidLoad()
      {
            super.viewDidLoad()
            
            initViewDidLoad()
            registerCells()
            
            initCallBacks()
      }
      
      public override func viewDidAppear(_ animated: Bool)
      {
            super.viewDidAppear(true)
            
            getStatementData()
      }
      
      public override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            bankStatementTableView.frame = view.bounds
      }
      
      public func initViewDidLoad()
      {
            self.navigationController?.isNavigationBarHidden = true
            
            bankStatementTableView = UITableView(frame: CGRect.zero, style: .grouped)
            bankStatementTableView.separatorStyle = .none
            bankStatementTableView.backgroundColor = uiColorApp
      }
      
      public func registerCells()
      {
            let totalStatementBundle = Bundle(for: TotalStatementTableViewCell.self)
            self.bankStatementTableView.register(UINib(nibName: "TotalStatementTableViewCell", bundle: totalStatementBundle), forCellReuseIdentifier: CellReuseIdentifier.TotalStatementTableViewCell.rawValue)
            
            let headerStatementBundle = Bundle(for: HeaderStatementTableViewCell.self)
            self.bankStatementTableView.register(UINib(nibName: "HeaderStatementTableViewCell", bundle: headerStatementBundle), forCellReuseIdentifier: CellReuseIdentifier.HeaderStatementTableViewCell.rawValue)
            let statementBundle = Bundle(for: StatementTableViewCell.self)
            self.bankStatementTableView.register(UINib(nibName: "StatementTableViewCell", bundle: statementBundle), forCellReuseIdentifier: CellReuseIdentifier.StatementTableViewCell.rawValue)
      }
      
      public func getStatementData()
      {
            guard let userId = userWSLogin?.userAccount.userId else { return }
            
            let userId2String = String(userId)

            bankStatementViewModel.getBankStatementData( userId2String )
      }
      
      public func initCallBacks()
      {
            bankStatementViewModel.isLoading.asObservable()
                  .bind{ [self] isLoading in
                        if isLoading
                        {
                              displayLoadingV = self.view.startLoadingOnActiveView()
                        }
                        else
                        {
                              self.view.stopLoadingOnActiveView(displayLoadingV)
                        }
                  }.disposed(by: disposeBag)
            
            bankStatementViewModel.isSuccess.asObservable()
                  .bind{ isSuccess in
                        self.bankStatementTableView.reloadData()
                  }.disposed(by: disposeBag)
              
            bankStatementViewModel.errorMsg.asObservable()
                  .bind { errorMessage in
                        if !errorMessage.isEmpty
                        {
                              self.showErrorAlert(errorMessage)
                        }
                  }.disposed(by: disposeBag)
          }
      
}
