//
//  ViewController.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 03/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var servico = Api()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text! = GravarDados.gd.userSalvo
        password.text! = GravarDados.gd.passwordSalvo
        
    }
    
    func validar(userValidar: String, senhaValidar: String) -> Bool {
        
        if isValidUser(userStr: userValidar) && isValidPassword(senhaStr: senhaValidar) {
            return true
        }
        
        return false
    }
    
    //MARK: Validar senha
    func isValidPassword (senhaStr: String) -> Bool {
        
        let leters : NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let specialCharacteres : NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,")
        let numbers : NSCharacterSet = NSCharacterSet(charactersIn: "0123456789")
        
        if (senhaStr.rangeOfCharacter(from: leters as CharacterSet) != nil)
            && (senhaStr.rangeOfCharacter(from: specialCharacteres as CharacterSet) != nil)
            && (senhaStr.rangeOfCharacter(from: numbers as CharacterSet) != nil) {
            
            return true
            
        } else {
            let alertError = UIAlertController(title: "Aviso!", message: "Erro ao validar senha.", preferredStyle: UIAlertController.Style.alert)
            let alertOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alertError.addAction(alertOk)
            self.present(alertError, animated: true, completion: nil)
        }
        
        return false
    }
    
    //MARK: Validar user
    func isValidUser(userStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if userStr.isValidCPF || emailPred.evaluate(with: userStr) {
            return true
            
        } else {
            let alertError = UIAlertController(title: "Aviso!", message: "Erro ao validar login.", preferredStyle: UIAlertController.Style.alert)
            let alertOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alertError.addAction(alertOk)
            self.present(alertError, animated: true, completion: nil)
        }
        
        return false
    }
    
    func navegarParaDetalhes(user: Usuario) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            
            controller.users = user
            
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func gravarDadosLogin (userGravar: String, senhaGravar: String) {
        
        UserDefaults.standard.set(userGravar, forKey: "user")
        UserDefaults.standard.set(senhaGravar, forKey: "password")
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        
        //recuperar campos
        let userText = username.text!
        let senhaText = password.text!
        
        if validar(userValidar: userText, senhaValidar: senhaText) {
            servico.loginRequest(userRequest: userText, senhaRequest: senhaText) { user in
                self.navegarParaDetalhes(user: user)
            }
            gravarDadosLogin(userGravar: userText, senhaGravar: senhaText)
            
        } else {
            //            let alertError = UIAlertController(title: "Aviso!", message: "Erro ao validar login e senha.", preferredStyle: UIAlertController.Style.alert)
            //            let alertOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            //
            //            alertError.addAction(alertOk)
            //            self.present(alertError, animated: true, completion: nil)
        }
        
    }
    
    
}

