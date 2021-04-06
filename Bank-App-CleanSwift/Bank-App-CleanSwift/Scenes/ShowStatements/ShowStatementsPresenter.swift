//
//  ShowStatementsPresenter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

protocol ShowStatementsPresentationLogic {
    func presentUserInfo(response: ShowStatements.UserAccountDescription.Response)
    func presentStatements(response: ShowStatements.ShowStatements.Response)
}


class ShowStatementsPresenter: ShowStatementsPresentationLogic {
    var viewController: ShowStatementsLogic?
        
    // MARK: - Present User Info
    /// Formats `response` contents properly
    /// - Parameter response: a `response` object
    func presentUserInfo(response: ShowStatements.UserAccountDescription.Response) {
        if let userAccount = response.userAccount {
            let name = userAccount.name!
            let accountWithAgency = self.createAccountWithAgencyString(account: userAccount.bankAccount!,
                                                                       agency: userAccount.agency!)
            let balance = self.createBalanceString(balance: userAccount.balance!)
            let fields = ShowStatements.UserAccountDescriptionFields(name: name,
                                                                     accountWithAgency: accountWithAgency,
                                                                     balance: balance)
            let viewModel = ShowStatements.UserAccountDescription.ViewModel(fields: fields)
            viewController?.displayUserAccountInfo(viewModel: viewModel)
        }
    }
        
    // MARK: - Create Account With Agency String
    /// Mixes a given account and a given agency strings, and applies the format xxxx / xx.xxxxxx-xx
    /// - Parameters:
    ///   - account: a `string` representing an account number
    ///   - agency: a `string` representing an agency number
    /// - Returns: a xxxx / xx.xxxxxx-xx format`string` with `account` and `agency`
    private func createAccountWithAgencyString(account: String, agency: String) -> String {
        let safeAccount = agency
        let safeAgency = account
        
        let accountPrefix = safeAccount.prefix(2)
        let accountMiddle = safeAccount.suffix(7).prefix(6)
        let accountDigit = safeAccount.suffix(1)
        
        return "\(safeAgency) / \(accountPrefix).\(accountMiddle)-\(accountDigit)"
    }
    
    // MARK: - Create Balance String
    /// Converts a double currency value to a brazilian currency format string (including brazilian sign R$)
    /// - Parameter balance: a `double` value (with dots separating decimail values) representing an amount
    /// - Returns: a `string` value containing the brazilian sign R$ plus the amount with comma separating decimal values
    private func createBalanceString(balance: Double) -> String {
        return self.applyBrazilianCurrencyFormat(in: balance)
    }
    
    
    // MARK: - Present Statements
    /// Prepares the `response` contents to be showed in view controller
    /// - Parameter response: a `response` object
    func presentStatements(response: ShowStatements.ShowStatements.Response) {
        if let statementDataArray = response.statementDataArray {
            var statements: [Statement] = []
            for statementData in statementDataArray {
                let statement = self.createStatement(from: statementData)
                
                statements.append(statement)
            }
            let viewModel = ShowStatements.ShowStatements.ViewModel(statements: statements, error: nil)
            viewController?.showStatements(viewModel: viewModel)
            
        } else if let errorData = response.error {
            let error = ErrorMessage(code: errorData.code!, message: errorData.message!)
            
            let viewModel = ShowStatements.ShowStatements.ViewModel(statements: nil, error: error)
            viewController?.showErrorAlert(viewModel: viewModel)
        }
    }
    
    
    // MARK: - Create Statements
    /// Creates a `Statement` object based on a `StatementData`
    /// - Parameter statementData: the `statementData` object
    /// - Returns: a `Statement` object
    private func createStatement(from statementData: StatementListData.StatementData) -> Statement {
        let title = statementData.title!
        let description = statementData.description!
        let date = self.formatDate(statementData.date!)
        let totalAmount = self.formatValue(statementData.totalAmount!)
        
        return Statement(title: title, description: description, date: date, totalAmount: totalAmount)
    }
    
    
    // MARK: - Format Date
    /// Formats a date from pattern `yyyy-MM-dd` to `dd/MM/yyyy`
    /// - Parameter oldDate: the date `String` in US pattern
    /// - Returns: a date `String` in BR pattern
    private func formatDate(_ oldDate: String) -> String {
        let year = oldDate.prefix(4)
        let month = oldDate.prefix(7).suffix(2)
        let day = oldDate.suffix(2)
        
        let dateConvertedString = "\(day)/\(month)/\(year)"
        
        return dateConvertedString
    }
    
    // MARK: - Format Amount
    /// Transforms a `double` value representing an amount in a BR currency formatting value. If `oldAmount` is `3.23`, then the method
    /// returns `"R$ 3,23"`
    /// - Parameter oldAmount: a `double` value representing an currency amount
    /// - Returns: a BR-formatted `string` representation of this value
    private func formatValue(_ oldAmount: Double) -> String {
        return applyBrazilianCurrencyFormat(in: oldAmount)
    }
        
    
    // MARK: - Apply brazilian currency format
    /// Transforms a `double` value in a BR currency format string
    /// - Parameter doubleValue: a `double` value representing an amount
    /// - Returns: a `String` representing a brazilian currency value
    private func applyBrazilianCurrencyFormat(in doubleValue: Double) -> String {
        let number = NumberFormatter()
        number.numberStyle = .currency
        number.usesGroupingSeparator = true
        number.locale = Locale(identifier: "pt_BR")
        
        let numberNS = NSNumber(value: doubleValue)
        let balanceString = number.string(from: numberNS)!.replacingOccurrences(of: " ", with: "")
        
        return balanceString
    }
}
