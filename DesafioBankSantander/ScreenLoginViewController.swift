//
//  ViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/13/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator

class ScreenLoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let service: LoginApi = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    func password(password: String) -> Bool {
        let character: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%^&*()_-+=~`|]}[{':;?/<>.,")
        let letter: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let number: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        
        if(password.rangeOfCharacter(from: character as CharacterSet) != nil) && (password.rangeOfCharacter(from: letter  as CharacterSet) != nil) && (password.rangeOfCharacter(from: number as CharacterSet) != nil) {
            return true
        }
        return false
    }
    

    func login(user: String, password: String) {
        service.login(user: user, password: password) {
            user in
            self.browseScreenDetails(user: user)
        }
    }
    
    func browseScreenDetails(user: Client) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier:
            "DetailsViewController") as? DetailsViewController {
    
            controller.client = user
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func btnLogin(sender: UIButton) {
        let user = userTextField.text!
        let password = passwordTextField.text!
        
        if self.checkUser(user: user) {
            if self.password(password: password) {
                login(user: user, password: password)
            } else {
                print("Incorrect password")
            }
        } else {
            print("Incorrect user")
        }
    }
    func checkCpf(user: String) -> Bool {
        let valid = BooleanValidator().validate(cpf: user)
        if valid {
            return true
        }
        return false
    }
    
    func checkEmail(user: String) -> Bool {
        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", format)
        return emailPredicate.evaluate(with: user)
    }
    
    func checkUser(user: String) -> Bool {
        if(checkCpf(user: user)) {
          return true
        } else if (checkEmail(user: user)) {
            return true
        } else {
            return false
        }
    }
}
    



