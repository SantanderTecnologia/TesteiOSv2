//
//  Constants.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation


/// Constants representing strings or objects for general purposes

struct Constants {
    // MARK: -
    /// Response in case the user inserts `username` or `password` invalid based on login business logic 
    static let USER_OR_PASSWORD_INVALID_RESPONSE: Login.Login.Response = {
        let userAccount: UserAccount? = nil
        let errorMessage: ErrorMessage? = ErrorMessage(code: 23, message: OUT_OF_PATTERN_FIELDS_MESSAGE)
        
        return Login.Login.Response(user: userAccount, error: errorMessage)
    }()
    
    // MARK: -
    /// Constants for use in error alert
    static let WRONG_FIELDS_MESSAGE = "Parece que o usuário e a senha informados não coincidem com os dados cadastrados no sistema. Uma boa ideia seria entrar em contato com o banco e solicitar um lembrete de senha ou uma nova."
    static let OUT_OF_PATTERN_FIELDS_MESSAGE =  """
                            Pode ser que sua senha não esteja em um formato válido (6 digitos no mínimo, sendo ao menos uma letra maiuscula, um número e um caractere especial).
                            
                            Que tal verificar, também, se seu nome de usuário é um email ou CPF válido?
                            """
    
    static let STATEMENTS_NOT_FOUND = "Não foi possível mostrar seus lançamentos bancários. Por favor, tente mais tarde. \nCaso prefira, fale com a Central de Atendimento Bank, pelo telefone \n(11) 1234 0987."
    static let DEFAULT_ALERT_TITLE = "Algo não saiu como esperado..."
    static let I_WILL_CHECK_ALERT_BUTTON_CAPTION = "Vou verificar!"
    static let OK_ALERT_BUTTON_CAPTION = "Tudo bem"
    
    
    // MARK: - Constants for use as keys in UserDefaults storage
    static let USERNAME_KEY = "username"
    static let USER_KEY = "user"
    
    // MARK: - Constants for screen navigation
    static let SEGUE_ID_TO_STATEMENTS = "showStatements"
    static let SHOW_STATEMENTS_VC_ID = "ShowStatementsViewController"
    
    // MARK: - Constants for cell
    static let CELL_ID = "StatementTableViewCell"
}
