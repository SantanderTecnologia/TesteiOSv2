//
//  HomeViewController.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright (c) 2019 Sam. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: class {
  func displaySomething(viewModel: Home.ViewModel)
}

class HomeViewController: BaseViewController {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAccount: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var router: HomeRouter
    private var interactor: HomeInteractor
    private var presenter: HomePresenter
    private var tableViewDataSource: HomeDataSource?

    init(interactor: HomeInteractor, router: HomeRouter, presenter: HomePresenter) {
        self.interactor = interactor
        self.interactor.presenter = presenter
        self.presenter = presenter
        self.router = router
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Object lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doSomething()
    }
    
    // MARK: Setup
    private func setupView() {
        presenter.viewController = self
        
        HomeDataSource.setupHome(tableView: tableView)
        tableViewDataSource = HomeDataSource(presenter: presenter)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
    }
    
    func doSomething() {
        let request = Home.Request(userId: interactor.user.userId)
        interactor.doSomething(request: request)
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        interactor.removeUser()
        router.routeToSomewhere(home: self)
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displaySomething(viewModel: Home.ViewModel) {
        userName.text = viewModel.response.user?.name
        userAccount.text = viewModel.response.user?.account
        userBalance.text = viewModel.response.user?.balance
        tableView.reloadData()
    }
}
