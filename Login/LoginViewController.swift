//
//  LoginViewController.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit


protocol LoginDisplayLogic: class {
    func displayValidation(viewModel: Login.Validate.ViewModel)
    func displayStatements(viewModel: Login.ServerValidate.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic, UITextFieldDelegate {
   
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
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
   
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let request = Login.Validate.Request(userId: userTextField.text!, password: passwordTextField.text!)
        interactor?.validate(request: request)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //User Text Field configs
        userTextField.layer.borderColor = UIColor.gray.cgColor
        userTextField.autocorrectionType = .no
        loadUser()
        
        //password Text Field configs
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.autocorrectionType = .no
        passwordTextField.delegate = self
        
        //Button Configs
        loginButton.layer.cornerRadius = 4
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        loginButton.layer.shadowRadius = 4
        loginButton.layer.shadowOpacity = 0.7
        
        
    }
  
    
    //Keychain load user
    func loadUser(){
        let keychainUser = KeychainUsername(service: "Username", account: "Lucas-Santander-Test")
        do {
            try userTextField.text = keychainUser.load()
        } catch {}
    }
    
    //Keychain save user
    func saveUser(){
        let keychainUser = KeychainUsername(service: "Username", account: "Lucas-Santander-Test")
        do {
            if let username = userTextField.text {
                try keychainUser.save(username)
                
            }
        } catch {}
    }

    //Displays
    
    func displayStatements(viewModel: Login.ServerValidate.ViewModel) {
        removeSpinner()
        if viewModel.isAuthenticated{
            saveUser()
            passwordTextField.text?.removeAll()
            router?.routeToSomewhere(segue: nil)
        }
    }
    
    
    func displayValidation(viewModel: Login.Validate.ViewModel) {
        
        if !viewModel.isValid {
            let errorAlert = UIAlertController(title: "Ops", message: "Usuário e/ou senha inválidos", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            })
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
        else{
            showSpinner(onView: self.view)
            let request = Login.Validate.Request(userId: userTextField.text!, password: passwordTextField.text!)
            interactor?.fetch(request: request)
        }
        
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField{
            textField.resignFirstResponder()
        }
        else if textField == userTextField{
            passwordTextField.becomeFirstResponder()
        }
        
        return true
    }
    

  
}


//Loading spinner
var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        
        DispatchQueue.main.async {
            let ai = UIActivityIndicatorView.init(style: .whiteLarge)
            ai.startAnimating()
            ai.center = spinnerView.center
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

