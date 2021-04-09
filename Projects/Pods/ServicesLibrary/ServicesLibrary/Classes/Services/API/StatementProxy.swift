//
//  StatementProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import ModelsLibrary
import RxSwift
import RxAlamofire

public
class StatementProxy
{
      
      public
      static func bankStatementRxGETDataAction( _ userId: String ) -> Observable<UserRootStatement>
      {
            let urlPath = "Statements/\(userId)"

            let fullPath = FullURLProxy.fullURLproxy(urlPath)
            
            return Observable<UserRootStatement>.create
            {  observer  in
                  _ = RxAlamofire.data(.get, fullPath)
                        .map({ ( rxAlamofireData ) -> UserRootStatement in
                              return try JSONDecoder().decode(UserRootStatement.self, from: rxAlamofireData)
                        })
                        .subscribe { ( rxUserRootStatement ) in
                              print("rxUserRootStatement ---> \(rxUserRootStatement)")
                              observer.onNext( rxUserRootStatement )
                              observer.onCompleted()
                        } onError: { ( rxUserRootStatementError ) in
                              print("rxUserRootStatementError ---> \(rxUserRootStatementError)")

                        } onCompleted: {
                              print("rxOnCompleted --->")

                        } onDisposed: {
                              print("onDisposed --->")

                        }
                  
                  return Disposables.create()
            }
      }
            
}


