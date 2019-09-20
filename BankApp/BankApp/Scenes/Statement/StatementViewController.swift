//
//  StatementViewController.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright (c) 2019 Marcus Titton. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementDisplayLogic: class
{
    func showStatement(statements: Statement.StatementApi.Response)
}

class StatementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StatementDisplayLogic
{
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    var listStatements: [StatementUser] = []
    
    @IBOutlet weak var txt_name: UILabel!
    @IBOutlet weak var txt_bank_agency: UILabel!
    @IBOutlet weak var txt_balance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
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
  
    // MARK: Setup
    private func setup()
    {
        let viewController = self
        let interactor = StatementInteractor()
        let presenter = StatementPresenter()
        let router = StatementRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let user = router?.dataStore?.user {
            txt_name.text = user.name
            txt_bank_agency.text = "\(user.bankAccount) / \(user.agency)"
            txt_balance.text = user.balance.formataMoeda()
        }
        
        tableView.separatorStyle = .none
        tableView.reloadData()
        
        //Captura o extrato
        getStatement()
    }
    
    func showStatement(statements: Statement.StatementApi.Response)
    {
        listStatements = statements.statement
        
        tableView.reloadData()
    }
    
    func getStatement()
    {
        let request =  Statement.StatementApi.Request(userId: (router?.dataStore?.user.userId)!)
        interactor?.getStatement(request: request)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStatements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statement = listStatements[indexPath.row]
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! StatementCell
        
        celula.txt_titulo.text = statement.title
        celula.txt_descricao.text = statement.desc
        celula.txt_data.text = statement.date.formataData()
        celula.txt_valor.text = statement.value.formataMoeda()
        
        return celula
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: nil)
    }
}
