//
//  LoginUserViewController.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import UIKit

protocol LoginUserDisplayLogic: class {
    func userLogged()
    func displayUser(_ viewModel: LoginUser.FetchUser.ViewModel)
}

class LoginUserViewController: UIViewController, LoginUserDisplayLogic {
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var txfLogin: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    
    
    // MARK: Properties
    
    var interactor: LoginUserBusinessLogic?
    var router: (NSObjectProtocol & LoginUserRoutingLogic & LoginUserDataPassing)?
    
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    
    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUser()
    }
    
    
    // MARK: Methods
    
    func fetchUser() {
        let request = LoginUser.FetchUser.Request()
        interactor?.fetchUser(request)
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginUserInteractor()
        let presenter = LoginUserPresenter()
        let router = LoginUserRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: @IBActions
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        let login = txfLogin.text!
        let password = txfPassword.text!
        guard !password.isEmpty || !login.isEmpty else {
            return
        }
        
        guard password.validate().valid else {
            let alert = UIAlertController(title: "Atenção", message: password.validate().message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            showDetailViewController(alert, sender: nil)
            return
        }
        
        let request = LoginUser.RequestUser.Request(user: login, password: password)
        interactor?.login(request)
    }
    
    
    // MARK: LoginUserDisplayLogic
    
    func displayUser(_ viewModel: LoginUser.FetchUser.ViewModel) {
        DispatchQueue.main.async {
            self.txfLogin.text = viewModel.login
        }
    }
    
    func userLogged() {
        performSegue(withIdentifier: "Statement", sender: nil)
    }
    
}
