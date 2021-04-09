//
//  LoginTableViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import UIKit
import WorkersLibrary

extension LoginViewController: UITableViewDataSource, UITableViewDelegate
{
      
      public func numberOfSections(in tableView: UITableView) -> Int
      {
            return 3
      }
            
      public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section
            {
            case 0:
                  return 1
                  
            case 1:
                  return 3
                  
            case 2:
                  return 1
                  
            default:
                  return 0
            }
      }
      
      public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
            let logoTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue) as! LogoTableViewCell
            
            let emailOrCPFTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue) as! EmailOrCPFTableViewCell
            let passwordTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue) as! PasswordTableViewCell
            
            let loginTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue) as! LoginTableViewCell
            
            switch (indexPath.section, indexPath.row)
            {
            case (0,0):
                  logoTableViewCell.selectionStyle = .none
                  logoTableViewCell.backgroundColor = UIColor.clear
                                    
                  logoTableViewCell.LogoImGV.contentMode = UIView.ContentMode.scaleAspectFit
                  
                  return logoTableViewCell
                  
            case (1,1):
                  emailOrCPFTableViewCell.selectionStyle = .none
                  emailOrCPFTableViewCell.backgroundColor = UIColor.clear
                                                      
                  emailOrCPFTableViewCell.emailOrCPFTxTF
                        .rx
                        .text
                        .orEmpty
                        .bind(to: loginViewModel.emailOrCPFModel.data)
                        .disposed(by: disposeBag)
                  
                  emailOrCPFTableViewCell.emailOrCPFTxTF
                        .rx
                        .controlEvent(.editingDidEndOnExit)
                        .subscribe { [weak self] _ in
                              self?.passwordTableViewCell!.passwordTxT.becomeFirstResponder()
                          }
                        .disposed(by: disposeBag)

                  self.emailOrCPFTableViewCell = emailOrCPFTableViewCell

                  return emailOrCPFTableViewCell
                  
            case (1,2):
                  passwordTableViewCell.selectionStyle = .none
                  passwordTableViewCell.backgroundColor = UIColor.clear
                  
                  passwordTableViewCell.passwordTxT.text = ""
                  
                  passwordTableViewCell.passwordTxT
                        .rx
                        .text
                        .orEmpty
                        .bind(to: loginViewModel.passwordModel.data)
                        .disposed(by: disposeBag)
                  
                  passwordTableViewCell.passwordTxT
                        .rx
                        .controlEvent([.editingDidEndOnExit])
                        .subscribe { [weak self] _ in
                              self!.dismissKeyboardVC()
                              
                              self!.loginRxUserAction()
                          }
                        .disposed(by: disposeBag)
                                                                        
                  self.passwordTableViewCell = passwordTableViewCell
                  
                  return passwordTableViewCell
                  
            case (2,0):
                  loginTableViewCell.selectionStyle = .none
                  loginTableViewCell.backgroundColor = UIColor.clear
                  
                  loginTableViewCell.loginBtN
                        .rx
                        .tap
                        .do(onNext:  { [unowned self] in
                              dismissKeyboardVC()
                        })
                        .subscribe(onNext: { [unowned self] in
                              loginRxUserAction()
                        }).disposed(by: disposeBag)
                                    
                  self.loginTableViewCell = loginTableViewCell
                  
                  return loginTableViewCell
                  
            default:
                  return UITableViewCell()
            }
      }
      
      public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
            switch indexPath.section
            {
            case 0:
                  return 110.0
                  
            default:
                  return 66.0
            }
      }
      
}
