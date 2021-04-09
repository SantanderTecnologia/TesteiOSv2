//
//  ViewController.swift
//  ServicesLibrary
//
//  Created by LeandroGitHung on 04/06/2021.
//  Copyright (c) 2021 LeandroGitHung. All rights reserved.
//

import UIKit
import ServicesLibrary
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
      public let disposeBag = DisposeBag()
      
      @IBOutlet weak var userAccountLbL : UILabel!
      
      override func viewDidLoad()
      {
            super.viewDidLoad()
            
            loginCredentialsAction()
      }
      
      override func didReceiveMemoryWarning()
      {
            super.didReceiveMemoryWarning()
      }
      
      func loginCredentialsAction()
      {
            LoginProxy.loginRxUserAction( "test_user", "Test@1" )
                  .bind { [self] userLogin in
                        print("LoginProxy userLogin ---> \(userLogin)")
                        
                        userAccountLbL.text = "\(userLogin)"
                  }
                  .disposed(by: disposeBag)
      }
}

