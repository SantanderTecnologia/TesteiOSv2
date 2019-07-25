//
//  ViewController.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 05/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator

class LoginViewController: UIViewController {

    let service: LoginService = ConexaAPI()
    
    @IBOutlet weak var outUser: UITextField!
    @IBOutlet weak var outPassword: UITextField!
    
    @IBAction func actLogin(_ sender: UIButton) {
        
        let user = outUser.text!
        let password = outPassword.text!
        
        if validateLogin(user: user, password: password) {
            login(user: user, password: password)
        } else {
            let popUp = "Verificar campos digitados"
            let title = "Atenção!"
            let alert = UIAlertController(title: title, message: popUp, preferredStyle: .alert)
            let button = "Ok"
            let action = UIAlertAction(title: button, style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func validateLogin(user: String, password: String) -> Bool {
        
        if user.isEmpty || password.isEmpty{
            return false
        } else if validateEmail(test: user) || validateCPF(test: user){
            if validatePassword(password: password){
                return true
            }
        }
        return false
    }
    
    func login(user: String, password: String){
        service.fazLogin(user: user, password: password) { user in
            self.goToDetails(user: user)
        }
    }
    
    func validateEmail(test: String) -> Bool{
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", email)
        
        return emailTest.evaluate(with: test)
    }
    
    func validateCPF(test: String) -> Bool{
        
        let sucess = BooleanValidator().validate(cpf: test)
        return sucess
    }
    
    func validatePassword(password: String) -> Bool {
        
        let number: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let uppercase: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let specialCharacters: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_+{}|\"':;,./<>?˜")
        
        if ((password.rangeOfCharacter(from: number as CharacterSet) != nil) && (password.rangeOfCharacter(from: uppercase as CharacterSet) != nil) && (password.rangeOfCharacter(from: specialCharacters as CharacterSet) != nil)) {
            return true
        }
        return false
    }
    
    func goToDetails(user: Usuario){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "Detalhes_ViewController")
            as? Detalhes_ViewController {
            controller.usuario = user
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

