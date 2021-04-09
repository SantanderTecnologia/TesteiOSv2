//
//  LoginViewController.swift
//  Alamofire
//
//  Created by LeandroLee on 08/04/21.
//

import UIKit
import WorkersLibrary
import RxSwift
import RxCocoa

public let loginViewModel = LoginViewModel()

public
class LoginViewController: UIViewController
{
      public var emailOrCPFTableViewCell : EmailOrCPFTableViewCell?
      public var passwordTableViewCell : PasswordTableViewCell?

      public var loginTableViewCell : LoginTableViewCell?

      public var loginTableView: UITableView!
      {
            didSet
            {
                  loginTableView.delegate = self
                  loginTableView.dataSource = self

                  loginTableView.tableFooterView = UIView(frame: CGRect.zero)
                  loginTableView.tag = 101
                  
                  view.addSubview(loginTableView)
            }
      }

      public var disposeBag = DisposeBag()
      
      public override func viewDidLoad()
      {
            super.viewDidLoad()

            initViewDidLoad()
            registerCells()

            initCallBacks()
      }

      public override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()

            loginTableView.frame = view.bounds
      }
      
      public func initViewDidLoad()
      {
            loginTableView = UITableView(frame: CGRect.zero, style: .grouped)
            loginTableView.separatorStyle = .none
            loginTableView.allowsSelection = false
            loginTableView.backgroundColor = uiColorWhite
      }

      public func resetViewWillDisappear()
      {
            self.loginTableView.reloadData()
      }

      public func registerCells()
      {
            let logoBundle = Bundle(for: LogoTableViewCell.self)
            self.loginTableView.register(UINib(nibName: "LogoTableViewCell", bundle: logoBundle), forCellReuseIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue)
  
            let emailOrCPFBundle = Bundle(for: EmailOrCPFTableViewCell.self)
            self.loginTableView.register(UINib(nibName: "EmailOrCPFTableViewCell", bundle: emailOrCPFBundle), forCellReuseIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue)
            
            let passwordBundle = Bundle(for: PasswordTableViewCell.self)
            self.loginTableView.register(UINib(nibName: "PasswordTableViewCell", bundle: passwordBundle), forCellReuseIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue)

            let loginBundle = Bundle(for: LoginTableViewCell.self)
            self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: loginBundle), forCellReuseIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue)
      }
      
      public func initCallBacks()
      {
            loginViewModel.isLoading.asObservable()
                  .bind{ isLoading in
                        if isLoading
                        {
                              displayLoadingV = self.view.startLoadingOnActiveView()
                        }
                        else
                        {
                              self.passwordTableViewCell?.passwordTxT.text = ""

                              self.view.stopLoadingOnActiveView(displayLoadingV)
                        }
                  }.disposed(by: disposeBag)
            
            loginViewModel.isSuccess.asObservable()
                  .bind{ isSuccess in
                        if isSuccess
                        {
                              self.bankStatementAction()
                        }
                  }.disposed(by: disposeBag)
              
            loginViewModel.errorMsg.asObservable()
                  .bind { errorMessage in
                        if !errorMessage.isEmpty
                        {
                              self.showErrorAlert(errorMessage)
                        }
                  }.disposed(by: disposeBag)
          }

}
