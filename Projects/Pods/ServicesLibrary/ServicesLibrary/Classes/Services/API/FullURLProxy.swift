//
//  FullURLProxy.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

public class FullURLProxy: RootEndPointProxy
{
      public static func fullURLproxy(_ wihPath: String ) -> String
    {
        return rootEndpoint + wihPath
    }
}
