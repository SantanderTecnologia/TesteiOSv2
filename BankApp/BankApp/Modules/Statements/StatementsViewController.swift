//
//  StatementsViewController.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class StatementsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_userName: UILabel!
    @IBOutlet weak var lb_userAccount: UILabel!
    @IBOutlet weak var lb_userBalance: UILabel!
    @IBOutlet weak var tableView_statements: UITableView!
    @IBOutlet weak var view_failToFetchStatements: UIView!
    @IBOutlet weak var lb_failToFetchStatements: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    lazy var lb_noItemsFound: UILabel = {
        let label = UILabel()
        label.text = "Você não possui transações recentes"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // MARK: Properties
    var interactor: StatementsInteractorProtocol?
    var statementsViewModel = StatementsModels.ViewModel(statements: [])
    
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        tableView_statements.delegate = self
        tableView_statements.dataSource = self
    }
    
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - UI Methods
    
    private func loading() {
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func loaded() {
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapTryToFetchAgain(_ sender: UIButton) {
        view_failToFetchStatements.isHidden = true
        interactor?.tryFetchAgain()
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        interactor?.logout()
    }

}

// MARK: - Presenter Delegate Methods

extension StatementsViewController: StatementsPresenterDelegate {
    func showUserInfo(_ userViewModel: StatementsModels.UserInfoViewModel) {
        lb_userName.text = userViewModel.name
        lb_userAccount.text = userViewModel.account
        lb_userBalance.text = userViewModel.balance
    }
    
    func startRequesting() {
        loading()
    }
    
    func finishRequesting() {
        loaded()
    }
    
    func displayStatements(viewModel: StatementsModels.ViewModel) {
        statementsViewModel = viewModel
        tableView_statements.reloadData()
        tableView_statements.backgroundView = nil
    }
    
    func zeroStatementsFound(viewModel: StatementsModels.ViewModel) {
        statementsViewModel = viewModel
        tableView_statements.reloadData()
        tableView_statements.backgroundView = lb_noItemsFound
    }
    
    func showFailToFetchStatements(_ errorMessage: String) {
        lb_failToFetchStatements.text = errorMessage
        view_failToFetchStatements.isHidden = false
    }
}


// MARK: - TableView Methods

extension StatementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementsViewModel.numStatements
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! StatementTableViewCell
        cell.statement = statementsViewModel.at(indexPath.row)
        
        return cell
    }
}
