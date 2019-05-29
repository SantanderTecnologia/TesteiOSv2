//
//  LoginViewController.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright (c) 2019 Felipe Alexander Silva Melo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Moya

protocol LoginDisplayLogic: class {
    func displaySomething(viewModel: Login.Login.ViewModel)
}

class LoginViewController: BaseViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    // MARK: Object lifecycle
    @IBOutlet weak var loginButton: UIButton!
    
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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
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
        setupLayout()
        doSomething()
        
        let provider = MoyaProvider<APIRouter>()
        let service = APIServiceImpl(provider: provider)
        let repository = APIRepositoryImpl(service: service)
        
        repository
            .login(user: "teste_user", password: "Test@1")
            .asObservable()
            .subscribe(
                onNext: { (response) in
                    print(response)
                },
                onError: { (error) in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
        
        repository
            .fetchStatements()
            .asObservable()
            .subscribe(
                onNext: { (response) in
                    print(response)
                },
                onError: { (error) in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
    }
    
    fileprivate func setupLayout() {
        // Setup login button Layout
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = false
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.warmBlue.cgColor
        
        loginButton.layer.shadowColor = UIColor.warmBlue.cgColor
        loginButton.layer.shadowOpacity = 0.3
        loginButton.layer.shadowRadius = 5
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func doSomething() {
//        let request = Login.Something.Request()
//        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Login.Login.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
