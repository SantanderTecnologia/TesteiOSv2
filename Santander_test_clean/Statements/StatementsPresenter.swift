
import UIKit
import Foundation

protocol StatementsPresentationLogic
{
    func dataUser(data: UserAccount)
    func getStantementList(statements:[Statemeant])
    
}

class StatementsPresenter: StatementsPresentationLogic
{
    weak var viewController: StatementsDisplayLogic!
    
    func getStantementList(statements: [Statemeant]) {
        viewController?.listStantement(stantement: statements)
    }
    
    func dataUser(data: UserAccount) {
        if let agency = data.agency,
            let bankAccount = data.bankAccount {
            let dataAccount = "\(bankAccount) / \(agency.toAgency)"
            viewController?.showUserAccount(user: data, dataAccount: dataAccount)
        }
    }
}
