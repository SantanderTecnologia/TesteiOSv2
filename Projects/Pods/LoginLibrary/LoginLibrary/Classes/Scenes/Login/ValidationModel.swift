//
//  protocolValidationModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import RxCocoa

public
protocol ValidationModel
{
      var titleMessage: String { get }
      var errorMessage: String { get }
      
      var data: BehaviorRelay<String> { get set }
      var errorValue: BehaviorRelay<String?> { get}
      
      func validateData() -> Bool
}
