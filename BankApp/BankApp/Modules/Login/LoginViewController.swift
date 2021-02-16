//
//  LoginViewController.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class LoginViewController: UIViewController, LoginFormProtocol {
    
    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var field_username: UITextField!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var lb_userSavedLocally: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var interactor: LoginInteractorProtocol?
    
    // LoginFormProtocol
    var username: String? { return field_username.text }
    var password: String? { return field_password.text }
    

    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginRouter.createModule(view: self)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.viewWillAppear()
    }
    
    
    // MARK: - Setup View Methods
    
    private func setupView() {
        self.addKeyboardObserver(for: scrollView, named: "LoginVC")
    }
    
    
    // MARK: - Methods
    
    private func loading() {
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func loaded() {
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        interactor?.login(self)
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

}


// MARK: - Presenter Delegate Methods

extension LoginViewController: LoginPresenterDelegate {
    func startRequesting() {
        loading()
    }
    
    func finishRequesting() {
        loaded()
    }
    
    func showValidationError(_ errorMessage: String) {
        showDefaultAlert(title: "Aviso", message: errorMessage)
    }
    
    func showLoginError(_ errorMessage: String) {
        showDefaultAlert(title: "Erro", message: errorMessage)
    }
    
    func clearFields() {
        field_username.text = ""
        field_password.text = ""
    }
    
    func presentUserSavedLocally() {
        lb_userSavedLocally.alpha = 1
    }
    
    func hideUserSavedLocally() {
        lb_userSavedLocally.alpha = 0
    }
}
