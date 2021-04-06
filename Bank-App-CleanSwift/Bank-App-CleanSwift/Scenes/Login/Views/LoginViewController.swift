//
//  LoginViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 14/03/21.
//

import UIKit

protocol DisplayLoginLogic: class {
    func displayLoginResult(viewModel: Login.Login.ViewModel)
    func setUsernameTextWithLastUserLoggedIn(with viewModel: Login.FetchLastLoggedUser.ViewModel)
}

class LoginViewController: UIViewController, DisplayLoginLogic {
    // MARK: - Outlets
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: LoadingButton!
    
    var interactor: LoginBusinessLogic!
    var router: (NSObjectProtocol & ShowUserDataPassing & LoginRoutingLogic)?
    
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hideNavigationBar()
        self.dismissKey()
        self.setupCleanSwiftObjects()
        
        interactor.fetchLastLoggedUsername(request: Login.FetchLastLoggedUser.Request())
    }
    
    // MARK: - Login Button Pressed
    @IBAction func loginButtonPressed(_ sender: LoadingButton) {
        self.loginButton.showActivityIndicator()
        
        let username = userText.text!
        let password = passwordText.text!                
        let request = Login.Login.Request(fields: Login.LoginFields(username: username,
                                                                    password: password))
        interactor.doTryLogin(request: request)        
    }
    
    // MARK: - Setup Clean Swift's architecture objects
    private func setupCleanSwiftObjects() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController        
    }
    
    // MARK: - Display login result
    /// Based on `viewModel` contents, show an alert informing an error, or passes by the object to the next view
    /// - Parameter viewModel: a `ViewModel` which can contain an `ErrorMessage` or an `UserAccount`
    func displayLoginResult(viewModel: Login.Login.ViewModel) {
        self.loginButton.hideActivityIndicator()
        
        guard viewModel.user != nil else {
            self.presentErrorAlert(containing: viewModel.error!.message!)
            return 
        }
                
        self.passwordText.text = ""
        self.router?.routeToStatementsView()        
    }
        
    // MARK: - Present error alert
    /// Presents an customized error alert
    /// - Parameter errorMessage: the message that tells the error occurred
    private func presentErrorAlert(containing errorMessage: String) {
        let alertController = UIAlertController(title: Constants.DEFAULT_ALERT_TITLE,
                                                message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.I_WILL_CHECK_ALERT_BUTTON_CAPTION, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
    // MARK: - Set username text with last user logged in
    func setUsernameTextWithLastUserLoggedIn(with viewModel: Login.FetchLastLoggedUser.ViewModel) {
        self.userText.text = viewModel.username
    }
}

// MARK: - Extension
extension LoginViewController {
    /// Dismisses the keyboard when the app's user taps outside the textview
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// Objective-C-like method used in selector
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
