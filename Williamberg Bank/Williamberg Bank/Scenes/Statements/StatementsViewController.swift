//
//  StatementsViewController.swift
//  Williamberg Bank
//
//  Created by padrao on 23/05/20.
//  Copyright (c) 2020 Williamberg. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Lottie

protocol StatementsDisplayLogic: class
{
    func displayUserAccount(viewModel: Statements.LoadUserAccount.ViewModel)
    func displayStatements(viewModel: Statements.LoadStatements.ViewModel)
    func displayErrorMessage(viewModel: Statements.LoadStatements.ViewModel)
}

class StatementsViewController: UIViewController, UITableViewDataSource, StatementsDisplayLogic
{
  var interactor: StatementsBusinessLogic?
  var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = StatementsInteractor()
    let presenter = StatementsPresenter()
    let router = StatementsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//  {
//    if let scene = segue.identifier {
//      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//      if let router = router, router.responds(to: selector) {
//        router.perform(selector, with: segue)
//      }
//    }
//  }
    
    // MARK: IBOutlets
    @IBOutlet weak var userAccountView: UIView!
    @IBOutlet weak var nameUserAccountLabel: UILabel!
    @IBOutlet weak var accountUserAccountLabel: UILabel!
    @IBOutlet weak var balanceUserAccountLabel: UILabel!
    @IBOutlet weak var statementsTableview: UITableView!
    @IBOutlet weak var loadingView: AnimationView!
    @IBOutlet weak var adviseLabel: UILabel!
    
    
    //MARK: - IBActions
    @IBAction func logoutAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setupViews()
    loadUserAccount()
    loadStatements()
  }
  

    //MARK: - Auxiliar Methods
    func setupViews(){
        let constant = Constants()
        userAccountView.backgroundColor = constant.MAIN_PURPLE_COLOR
        
        statementsTableview.dataSource = self
        statementsTableview.allowsSelection = false
        
        adviseLabel.isHidden = true
        adviseLabel.textColor = constant.MAIN_PURPLE_COLOR
        adviseLabel.text = "Nenhum item no extrato"
        
        let animation = Animation.named("loading")
        loadingView.animation = animation
        loadingView.loopMode = .loop
        loadingView.contentMode = .scaleAspectFit
        loadingView.isHidden = true
    }
    
    func showLoadingView(){
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func hideLoadingView(){
        loadingView.isHidden = true
        loadingView.stop()
    }
    
    
  //MARK: - Load User Account
  var userAccount: UserAccount?
    
  func loadUserAccount()
  {
    let request = Statements.LoadUserAccount.Request()
    interactor?.loadUserAccount(request: request)
  }
  
  func displayUserAccount(viewModel: Statements.LoadUserAccount.ViewModel)
  {
    nameUserAccountLabel.text = viewModel.name
    accountUserAccountLabel.text = viewModel.account
    balanceUserAccountLabel.text = viewModel.balance
  }
    
  //MARK: - Fetch Statements
    var displayedStatements: [Statements.LoadStatements.ViewModel.DisplayedStatement] = []
    
    func loadStatements(){
        showLoadingView()
        let request = Statements.LoadStatements.Request()
        interactor?.loadStatements(request: request)
    }
    
    func displayStatements(viewModel: Statements.LoadStatements.ViewModel) {
        hideLoadingView()
        displayedStatements = viewModel.displayedStatements
        adviseLabel.isHidden = viewModel.hideAdviseLabel
        statementsTableview.reloadData()
    }
    
    func displayErrorMessage(viewModel: Statements.LoadStatements.ViewModel){
        hideLoadingView()
        let alert = UIAlertController(title: "Atenção", message: viewModel.errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedStatements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayStatements = displayedStatements[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell") as! StatementsTableViewCell
        cell.titleLabel.text = displayStatements.title
        cell.descricaoLabel .text = displayStatements.description
        cell.dateLabel.text = displayStatements.date
        cell.valueLabel.text = displayStatements.value
        return cell
    }
}
