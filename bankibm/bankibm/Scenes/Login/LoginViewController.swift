//
//  LoginViewController.swift
//  bankibm
//
//  Created by Alexandre Furquim on 02/11/18.
//  Copyright (c) 2018 Alexandre Furquim. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class {
    func displaySomething(viewModel: Login.Something.ViewModel)
    func displayLogin(viewModel: Login.loginFields.ViewModel)
}

class LoginViewController: UIViewController, UITextFieldDelegate, LoginDisplayLogic
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    //MARK: - • PRIVATE PROPERTIES
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    //
    @IBOutlet weak var btnLogin: UIButton!
    //
    weak var activeTextField: UITextField?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupLayout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //
        txtLogin.text = ""
        txtPassword.text = ""
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //MARK: - • OTHER DELEGATE/ PROTOCOL METHODS
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString stringDigitada: String) -> Bool {
        return true
    }
    
    
    // MARK: Do something
    
    func doSomething() {
        let request = Login.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Login.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func setupLayout(){
        //Self
        self.view.backgroundColor = UIColor.white
        //Navigation Controller
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = ToolBox.Graphic.colorWithHexString(string: "#FFFFFF")
        
        btnLogin.layer.cornerRadius = 10.0
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = ToolBox.Graphic.colorWithHexString(string: "#FFFFFF").cgColor
        btnLogin.backgroundColor = ToolBox.Graphic.colorWithHexString(string: "#477dbd")
        btnLogin.tintColor = ToolBox.Graphic.colorWithHexString(string: "#FFFFFF")
        
        if let retrievedUser = KeychainWrapper.standard.string(forKey: "userLoginKey"), !retrievedUser.isEmpty {
            txtLogin.text = retrievedUser
        }
        
        txtPassword.text = ""
        
    }
    
    @IBAction func doLogin(_ sender: Any) {
        
        let user = txtLogin.text ?? ""
        let password = txtPassword.text ?? ""
        let request = Login.loginFields.Request(user: user, password: password)
        
        if isUserValid() && isPasswordValid(){
            let saveSuccessful: Bool = KeychainWrapper.standard.set(user, forKey: "userLoginKey")
            print("Save was successful: \(saveSuccessful)")
            loadingAlert()
            interactor?.doLogin(request: request)
        }
    }
    
    // MARK: Do Login
    func isUserValid() -> Bool {
        
        let alert:SCLAlertViewPlus = SCLAlertViewPlus.createDefaultAlert()
        
        var retStatus = false
        if let user = txtLogin.text, !user.isEmpty {
            if !user.isNumeric {
                if ToolBox.Validation.emailChecker(email: user) == ToolBox.ToolBoxValidationResult.Approved{
                    retStatus = true
                }else{
                    alert.addButton(title: "OK", type: .Error, action: {
                        print("error")
                    })
                    alert.showWarning("Atenção", subTitle: "Você digitou um E-Mail inválido")
                }
            } else {
                if ToolBox.Validation.validate(CPF: user) == ToolBox.ToolBoxValidationResult.Approved{
                    retStatus = true
                }else{
                    alert.addButton(title: "OK", type: .Error, action: {
                        print("error")
                    })
                    alert.showWarning("Atenção", subTitle: "Você digitou um CPF inválido")
                }
            }
        } else {
            alert.addButton(title: "OK", type: .Error, action: {
                print("error")
            })
            alert.showWarning("Atenção", subTitle: "Por favor, informar um CPF válido ou um E-Mail válido")
        }
        return retStatus
    }
    
    func isPasswordValid() -> Bool {
        
        let alert:SCLAlertViewPlus = SCLAlertViewPlus.createDefaultAlert()
        
        var retStatus = false
        
        if let password = txtPassword.text, !password.isEmpty {
            
            
            if ToolBox.Validation.checkUperCaseLetter(letter: password) == ToolBox.ToolBoxValidationResult.Disapproved {
                alert.addButton(title: "OK", type: .Error, action: {
                    print("error")
                })
                alert.showWarning("Atenção", subTitle: "Sua Senha deve possuir pelo menos uma Letra Maiúscula")
                return false
            }
            
            if ToolBox.Validation.checkSpecialLetter(letter: password) == ToolBox.ToolBoxValidationResult.Disapproved {
                alert.addButton(title: "OK", type: .Error, action: {
                    print("error")
                })
                alert.showWarning("Atenção", subTitle: "Sua Senha deve possuir pelo menos um caracter Especial")
                return false
            }
            
            if (password.letterCount >= 1) || password.digitCount >= 1 {
                retStatus = true
            } else {
                alert.addButton(title: "OK", type: .Error, action: {
                    print("error")
                })
                alert.showWarning("Atenção", subTitle: "Sua Senha deve possuir pelo menos um caracter Alphanumérico")
            }
        } else {
            alert.addButton(title: "OK", type: .Error, action: {
                print("error")
            })
            alert.showWarning("Atenção", subTitle: "Por favor, informar uma senha")
            
        }
        return retStatus
    }
    
    func displayLogin(viewModel: Login.loginFields.ViewModel) {
        
        let alert:SCLAlertViewPlus = SCLAlertViewPlus.createDefaultAlert()
        
        if viewModel.success {
            DispatchQueue.main.async {
                self.dismiss(animated: false, completion: {
                    self.router?.routeToShowUserData(segue: nil)
                })
            }
        } else {
            alert.addButton(title: "OK", type: .Error, action: {
                print("error")
            })
            alert.showError("Atenção", subTitle: "Serviço indisponível, tente novamente mais tarde")
        }
    }
    
}
