//
//  HomeViewController.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 11/03/20.
//  Copyright (c) 2020 Mônica Marques. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import JGProgressHUD

protocol HomeDisplayLogic: class
{
    func displayUser(viewModel: Home.Something.ViewModel)
    func loadTableView()
    func showLoadingView()
    func hideLoadingView()
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    var loadingView = JGProgressHUD()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contaLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
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
        self.interactor?.getUserInfo()
        self.setupLoadingView()
        self.interactor?.fetchUserStatements()
    }
    
    
    private func setupLoadingView() {
        self.loadingView.textLabel.text = "Carregando..."
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func displayUser(viewModel: Home.Something.ViewModel) {
        self.nameLabel.text = viewModel.name
        self.contaLabel.text = viewModel.bankAgencyAccount
        self.saldoLabel.text = viewModel.balance
    }
    
    func showLoadingView() {
        self.loadingView.show(in: self.view)
    }
    
    func hideLoadingView() {
        self.loadingView.dismiss()
    }
    
    func loadTableView() {
        print(self.interactor?.statements)
    }
}
