//
//  LoginRepository.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

//typealias LoginSuccess = (_: LoginModel) -> Void

class LoginRepository {
    /* Eu costumo criar uma classe repositorio para facilitar os testes unitários.
     Alem de isolar a responsabilidade do carregamento de dados do presenter.
     Logo, se em algum momento futuro a camada de network mudar ou for preciso trabalhar com dados locais (coredata ou jsons), isso fica transparente para a presenter.
    */
}

extension LoginRepository: LoginRepositoryDelegate {
    func fetch(params: [String : String], success: @escaping Network<LoginModel>.Success, failure: @escaping Failure) {
        Network<LoginModel>.execute(request: LoginRequest(params: params), success: { loginModel in
            success(loginModel)
        }, failure: failure)
    }
    
    
}
