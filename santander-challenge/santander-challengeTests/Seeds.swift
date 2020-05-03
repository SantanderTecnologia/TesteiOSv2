//
//  Seeds.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import UIKit

struct Seeds {
    static let email = "foo@email.com"
    static let cpf = "19811565007"
    static let password = "A8*"

    static let user = User(id: 1, name: "Foo Bar", agency: 12345678, account: 456, balance: 9.99)

    struct Statements {
        static let internetPayment = Statement(title: "Pagamento", description: "Conta de Internet", date: Date(), value: -90.9)
        static let phonePayment = Statement(title: "Pagamento", description: "Conta de Telefone", date: Date(), value: -150.6)
        static let salary = Statement(title: "TED Recebida", description: "Salário", date: Date(), value: 1400.4)

        static let all = [internetPayment, phonePayment, salary]
    }
}
