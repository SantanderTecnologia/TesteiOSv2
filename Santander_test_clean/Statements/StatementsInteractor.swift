
import UIKit

protocol StatementsBusinessLogic
{
    func requestStatements()
}

protocol StatementsDataStore
{
    var userAccount: UserAccount { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore
{
    var userAccount = UserAccount()
     var presenter: StatementsPresentationLogic!
     let worker = StatementsWorker()
    
    func requestStatements() {
        worker.statements({ (statements) in
            self.presenter.getStantementList(statements: statements)
            self.presenter.dataUser(data: self.userAccount)
        }, failure: { (message) in
            
        })
    }
}
