@testable import BankApp
import XCTest

struct Seeds {
    struct UserInfo {
        static let user = User(user: "user", password: "pass")
        static let userError = User(user: "", password: "")
        static let loggedAccount = UserAccount(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        static let loginFromFields = Login.LoginFromFields(login: "asdf", password: "asdf")
        static let loginErrorFromFields = Login.LoginFromFields(login: "", password: "")
    }
    struct StatementInfo {
        static var arrayOne = [ListStatement.FetchStatement.ViewModel.DisplayedStatement(title: "1", desc: "1", date: "22/12/2020", value: "1")]
        static var arrayTwo = [ListStatement.FetchStatement.ViewModel.DisplayedStatement(title: "1", desc: "1", date: "22/12/2020", value: "1"), ListStatement.FetchStatement.ViewModel.DisplayedStatement(title: "2", desc: "2", date: "22/12/2020", value: "2")]
        
        static var statements = [Statement(title: "1", desc: "", date: "22/12/2020", value: 1),
                                 Statement(title: "2", desc: "", date: "23/12/2020", value: 2),
                                 Statement(title: "3", desc: "", date: "24/12/2020", value: 3),
                                 Statement(title: "4", desc: "", date: "25/12/2020", value: 4)]
    }
}
