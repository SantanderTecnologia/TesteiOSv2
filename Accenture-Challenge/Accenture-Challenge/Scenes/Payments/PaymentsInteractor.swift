//
//  PaymentsInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol PaymentsBusinessLogic {
    func fetchUserInfo(_ request: Payments.Request.UserInfo)
    func fetchStatements()
}

protocol PaymentsDataStore {
    var userAccount: Payments.Received.UserAccount? { get set }
    var payments: [Payments.Info.PaymentModel] { get set }
}

class PaymentsInteractor: PaymentsDataStore {
    
    private var presenter: PaymentsPresentationLogic
    private var worker: PaymentsWorkerProtocol
    
    var userAccount: Payments.Received.UserAccount?
    var payments: [Payments.Info.PaymentModel] = []
    
    init(viewController: PaymentsDisplayLogic,
         presenter: PaymentsPresentationLogic = PaymentsPresenter(),
         worker: PaymentsWorkerProtocol = PaymentsWorker()) {
        self.presenter = presenter
        self.worker = worker
        self.presenter.viewController = viewController
    }
}

extension PaymentsInteractor: PaymentsBusinessLogic {
    
    func fetchUserInfo(_ request: Payments.Request.UserInfo) {
        guard let userAccount = userAccount else {
            return
        }
        let formattedAccountInfo = "\(userAccount.bankAccount ?? .empty) / \(userAccount.agency ?? .empty)"
        let viewModel = Payments.Info.ViewModel.UserAccount(name: userAccount.name ?? .empty , accountInfo: formattedAccountInfo, balance: "R$ \(userAccount.balance ?? 0.0)")
        presenter.didFetchUserAccount(viewModel)
    }
    
    func fetchStatements() {
        guard let userId = userAccount?.userId else { return }
        worker.fetchStatements(Payments.Request.Statements(userId: String(userId))) { response in
            switch response {
            case .success(let statements):
                let viewModel = self.buildViewModel(statements)
                self.presenter.didFetchStatements(viewModel)
                break
            case .error(let error):
                self.presenter.didFetchError(error.localizedDescription)
                break
            case .genericError:
                self.presenter.didFetchError("Erro genérico")
                break
            }
        }
    }
}

extension PaymentsInteractor {
    
    private func buildViewModel(_ statements: [Payments.Response.Statements]) -> Payments.Info.ViewModel.Payment {
        var models: [Payments.Info.PaymentModel] = []
        for statement in statements {
            let valueStr = statement.value >= 0.0 ? "R$\(statement.value)" : "- R$\(-statement.value)"
            let dateStr = statement.date.replacingOccurrences(of: "-", with: "/")
            let model = Payments.Info.PaymentModel(title: statement.title,
                                                   paymentInfo: statement.desc,
                                                   date: dateStr,
                                                   value: valueStr)
            models.append(model)
        }
        let viewModel = Payments.Info.ViewModel.Payment(model: models)
        
        return viewModel
    }
}
