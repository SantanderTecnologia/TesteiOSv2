//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import UIKit
import VMaskTextField

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: CustomTextfield!
    @IBOutlet weak var passTextField: CustomTextfield!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    
    var interactor: LoginInteractorProtocol?
    var authenticated: (Bool, UserAuthModel?) = (false,nil) {
        didSet {
            if authenticated.0 { autoAuthenticate(authenticated.1)}
        }
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

// MARK: - Setup

extension LoginViewController {
    
    
    
    func setup() {
        let controller = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.controller = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
       
        
        passTextField.isSecureTextEntry = true
        
        userNameTextField.delegate = self
        userNameTextField.mask = "###.###.###-##"
        userNameTextField.text = SecureAPI.recoverCPF()
        
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "AppWasInstalled") {
            SecureAPI.removeUser()
           userNameTextField.text = ""
        }
        defaults.set(true, forKey: "AppWasInstalled")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        passTextField.text = ""
    }
    
}



// MARK: - Actions

extension LoginViewController {
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        validateFields()
        }
    }


// test_user
// Test@1

 

// MARK: - methods
extension LoginViewController {
    
    private func autoAuthenticate(_ loginData: UserAuthModel?) {
        if loginData != nil {
            interactor?.fetchUserData(username: "test_user", password: "Test@1")
        }
    }
    
    private func validateFields() {
        do  {
            // validate
            let user = try userNameTextField.validateByType(.user)
            let password = try passTextField.validateByType(.password)
            
            SecureAPI.login(user: UserAuthModel(name: user, password: password))
            
            interactor?.fetchUserData(username: "test_user", password: "Test@1")

        } catch let error as ValidationError {
            // send error to screen
            let alert = UIAlertController(title: "Whoops!", message: error.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } catch {}
    }
}


// MARK: - TextFields
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          if textField == passTextField {
             loginButtonPressed(loginButton)
         }

          return true
      }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cTextField = textField as? CustomTextfield
        return cTextField?.shouldChangeCharacters(in: range, replacementString: string) ?? false
    }
    
    
}
