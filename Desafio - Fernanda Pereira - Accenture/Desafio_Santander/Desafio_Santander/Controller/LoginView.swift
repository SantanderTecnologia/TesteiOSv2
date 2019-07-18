//
//  ViewController.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 05/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator


class LoginView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblVerifyUser.isHidden = true
        lblVerifyPassword.isHidden = true
        txtPassword.isSecureTextEntry = true
    }
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblVerifyUser: UILabel!
    @IBOutlet weak var lblVerifyPassword: UILabel!
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        let user = txtUser.text!
        let password = txtPassword.text!

        if verifyingFields(verifyUser: user, verifyPassword: password) {
            login(user: user, password: password)
            
        } else{
            print("Validating error")
        }
    }
    
    func verifyingFields (verifyUser: String, verifyPassword: String) -> Bool {
        
        if userValidate(user: verifyUser) && passwordValidate(password: verifyPassword) {
            if validateEmail(validate: verifyUser) || validateCPF(validate: verifyUser){
                if validatePassword(passwordValidation: verifyPassword){
                    return true
                }
            }
        }
        
        return false
    }
    
    func userValidate (user: String) ->  Bool {
        
        if user.count != 0 {
            lblVerifyUser.isHidden = true
            return true
            
        } else {
            lblVerifyUser.isHidden = false
            lblVerifyUser.text = "Please enter your CPF or e-mail"
        }
        
        return false
    }
    
    func passwordValidate (password: String) ->  Bool {
        
        if password.count != 0 {
            lblVerifyPassword.isHidden = true
            return true
            
        } else {
            lblVerifyPassword.isHidden = false
            lblVerifyPassword.text = "Please enter your password"
        }
        
        return false
    }
    
    func validateEmail(validate: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: validate)
    }
    
    func validateCPF(validate: String) -> Bool{
        let sucessful = BooleanValidator().validate(cpf: validate)
        return sucessful
    }
    
    func validatePassword(passwordValidation: String) -> Bool {
        let number: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let capitalLetters: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let EspecialCharacters: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_+{}|\"':;,./<>?˜")
        
        if ((passwordValidation.rangeOfCharacter(from: number as CharacterSet) != nil) && (passwordValidation.rangeOfCharacter(from: capitalLetters as CharacterSet) != nil) && (passwordValidation.rangeOfCharacter(from: EspecialCharacters as CharacterSet) != nil)) {
            return true
        }
        return false
    }
    
    let serviceRequest: LoginService = requestLogin()
    
    func goToDetails(user: Usuario){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = mainStoryboard.instantiateViewController(withIdentifier: "UserDetails") as? UserDetails{
            controller.userDetails = user
            
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func login(user: String, password: String){
        serviceRequest.login(user: user, password: password){ user in
            self.goToDetails(user: user)
            
            
        }
    }
    
    
}

