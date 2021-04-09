//
//  GetProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation
import ModelsLibrary
import RxSwift
import RxAlamofire
import RxCocoa

public
class LoginProxy
{
      
      public static func loginRxUserAction( _ user: String,_ password: String ) -> Observable<UserRoot>
      {
            let urlPath = "Login"

            let parameters = [
                  "user": user,
                  "password": password
            ]

            let fullPath = FullURLProxy.fullURLproxy(urlPath)
            
            return Observable<UserRoot>.create
            {  observer  in                  
                  _ = RxAlamofire.data(.post, fullPath, parameters: parameters)
                        .map({ ( rxAlamofireData ) -> UserRoot in
                              return try JSONDecoder().decode(UserRoot.self, from: rxAlamofireData)
                        })
                        .subscribe { ( rxUserLogin ) in
                              print("rxUserLogin ---> \(rxUserLogin)")
                              observer.onNext( rxUserLogin )
                              observer.onCompleted()
                        } onError: { ( rxUserError ) in
                              print("rxUserError ---> \(rxUserError)")

                        } onCompleted: {
                              print("rxOnCompleted --->")

                        } onDisposed: {
                              print("onDisposed --->")

                        }
                  
                  return Disposables.create()
            }
      }

}
