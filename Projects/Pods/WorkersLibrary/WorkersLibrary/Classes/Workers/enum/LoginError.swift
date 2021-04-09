//
//  enumLoginError.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import Foundation

public enum LoginError : String
{
      case AllDataFail = "Por favor, verifique os campos \"E-mail ou CPF e Senha\", e tente novamente!"
      
      case EmailOrCPFFail = "Por favor, verifique os campos \"E-mail ou CPF\", e tente novamente!"
      
      case EmailFail = "Por favor, verifique os campos \"E-mail\", e tente novamente!"
      
      case CPFFail = "Por favor, verifique os campos \"CPF\", e tente novamente!"
      
      case PasswordFail = "Por favor, verifique os campos \"Senha\", e tente novamente!"
}
