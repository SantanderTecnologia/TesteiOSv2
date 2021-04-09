//
//  BankStatementViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 02/04/21.
//

import Foundation
import WorkersLibrary
import ServicesLibrary
import RxSwift
import RxCocoa

public
class BankStatementViewModel
{
      public let isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      public let isSuccess : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      public let errorMsg : BehaviorRelay<String> = BehaviorRelay(value: "")
      
      public let disposeBag = DisposeBag()
            
      public func getBankStatementData(_ userId : String)
      {
            self.isLoading.accept( true )
            
            StatementProxy.bankStatementRxGETDataAction( userId )
                  .bind { [self] userStatementList in
                        print("StatementProxy userStatementList ---> \(userStatementList)")

                        userWSStatementList = userStatementList
                        userWSStatementListCount = (userWSStatementList?.statementList.count)!

                        self.isLoading.accept( false )
                        self.isSuccess.accept( true )
                        self.errorMsg.accept( "" )
                  }
                  .disposed(by: disposeBag)
      }
}
