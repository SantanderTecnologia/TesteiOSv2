//
//  StatementsViewController.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

protocol StatementsDisplayLogic: class {
    func displayStatements(viewModel: Statements.FetchStatements.ViewModel)
    func displayUserinfo(viewModel: Statements.PreviousScreen.ViewModel)
}

class StatementsViewController: UIViewController, StatementsDisplayLogic, UITableViewDelegate {
  
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
  
    private func setup() {
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
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statementsTableView.rowHeight = 119.0
        statementsTableView.delegate = self
        statementsTableView.register(UINib(nibName: "StatementsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "StatementsTableViewCell")
        
        fetchStatements()
        fetchUserInfo()
    }
  
    // MARK: Do something
  
    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerAccount: UILabel!
    @IBOutlet weak var customerBalance: UILabel!
    @IBOutlet weak var statementsTableView: UITableView!
    
    @IBAction func logoutButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //@IBOutlet weak var nameTextField: UITextField!
  
    //User Info
    func fetchUserInfo(){
        let request = Statements.PreviousScreen.Request()
        interactor?.passUserInfo(request: request)
    }
    
    func displayUserinfo(viewModel: Statements.PreviousScreen.ViewModel) {
        customerName.text = viewModel.userInfo.name
        customerAccount.text = viewModel.userInfo.agencyAccount
        customerBalance.text = viewModel.userInfo.balance.currency()
    }
    
    //Statements
    func fetchStatements() {
        let request = Statements.FetchStatements.Request()
        interactor?.fetchStatements(request: request)
    }
    
    func displayStatements(viewModel: Statements.FetchStatements.ViewModel) {
        statementsTableView.dataSource = viewModel.statementsData
        self.statementsTableView.reloadData()
    }
    
   
}
