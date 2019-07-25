//
//  ViewController.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 05/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator


class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    let service: LoginService = BankAPI()
    
    func isValidUser(user: String) -> Bool {
        if (isCPF(user: user) || (isEmail(user: user))){
            return true
        }
        return false
    }
   
    func isEmail (user: String) -> Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: user)
    }
    
    func isCPF(user:String) -> Bool{
        return BooleanValidator().validate(cpf: user)
    }
    
    
    func  isValidPassword(password:String) ->Bool {
       
        let number:NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let capitalLetter: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let especialCharacter: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,")
        
        if ((password.rangeOfCharacter(from: number as CharacterSet) != nil) && (password.rangeOfCharacter(from: capitalLetter as CharacterSet) != nil) && (password.rangeOfCharacter(from: especialCharacter as CharacterSet) != nil)) {
            return true
        }
        
        return false
    }
    
    func loadAccountDetails(user: User){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AccountDetailsViewController") as? AccountDetailsViewController {
            
            controller.user = user
            
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    func login(user: String, password: String){
        service.login(user: user, password: password) { user in
            self.loadAccountDetails(user: user)
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let user = txtUser.text!
        let password = txtPassword.text!
        
        if(isValidUser(user: user)) && isValidPassword(password: password){
            login(user: user, password: password)
        }
        else{
            lblError.text = "User or password not found"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtUser.text = ""
        txtPassword.text = ""
    }

}

