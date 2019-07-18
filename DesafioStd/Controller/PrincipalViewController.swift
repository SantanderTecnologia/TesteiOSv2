//
//  PrincipalViewController.swift
//  DesafioStd
//
//  Created by bianca.dos.s.sobral on 17/07/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let service: LoginService = Bancologin()
    
    func login(userLogin: String, senhaLogin: String) {
        service.login(userService: userLogin, passwordService: senhaLogin) { userCpmpletion in
            self.navegarParaDetalhes(userNavegar: userCpmpletion) }
    }
    
    
    
    func navegarParaDetalhes(userNavegar: Usuario) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesViewController") as?
            DetalhesViewController {
            
            controller.usuario = userNavegar
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
    func validarUser (user: String, senha: String)-> Bool {
        
        if let number = Int(user) {
            return validarCPF(user: user)
        } else {
            return validarEmail(user: user)
        }
    }
    
    
    func validarSenha (senha: String) -> Bool {
        
        let numeros: NSCharacterSet = NSCharacterSet(charactersIn: "1234567890")
        let letrasM: NSCharacterSet = NSCharacterSet(charactersIn: "[A-Z]")
        let charEspecial: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*˜`|}[{':;?/<>.,")
        if ((senha.rangeOfCharacter(from: numeros as CharacterSet) != nil) &&  (senha.rangeOfCharacter(from: letrasM as CharacterSet) != nil) && (senha.rangeOfCharacter(from: charEspecial as CharacterSet) != nil)){
            return true
        }
        return false
    }
    
    
    
    func validar (userValidar: String, senhaValidar: String) -> Bool {
        
        validarUser(user: userValidar, senha: senhaValidar)
        if senhaValidar.isEmpty{
            return false
        }
        validarSenha(senha: senhaValidar)
        return true
    }
    
    
    
    @IBAction func btnClickLogin(sender: UIButton) {
        
        let userClick = userTfield.text!
        let senhaClick = passwordTfield.text!
        
        if validar(userValidar: userClick, senhaValidar: senhaClick) {
            login(userLogin: userClick, senhaLogin: senhaClick)
            
        } else {
            print ("erro ao validar")
        }
    }
    
    @IBOutlet weak var userTfield: UITextField!
    @IBOutlet weak var passwordTfield: UITextField!
    
    
    func validarEmail (user: String)-> Bool {
        
        guard user != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: user)
    }
    func validarCPF (user: String) -> Bool{
        
        guard user != nil else {return false}
        let regEx = "([0-9]{2})/.([0-9]{3})/.([0-9]{3}-)([0-9]{2})"
        let predicate = NSPredicate (format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: user)
    }
    
    
    // Do any additional setup after loading the view.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


