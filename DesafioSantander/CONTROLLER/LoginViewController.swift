//
//  ViewController.swift
//  DesafioSantander
//
//  Created by daianne.gomes.aguiar on 03/07/19.
//  Copyright © 2019 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let service: LoginService = ConexaoAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isValidEmail(testStr: String) -> Bool{
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCH %@", email)
        return emailTest.evaluate(with: testStr)
    }
    
    func regraSenha(senha: String) -> Bool{
        let regraNum: NSCharacterSet = NSCharacterSet(charactersIn: "0123456789")
        let regraMaiuscula: NSCharacterSet = NSCharacterSet(charactersIn: "ABCDEFGHIJKLNOPQRSTUVWXYZ")
        let regraCharEspecial: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%ˆ&*()_-+=|]}[{';/?.>,<")
        
        if ((senha.rangeOfCharacter(from: regraNum as CharacterSet) != nil) && (senha.rangeOfCharacter(from: regraMaiuscula as CharacterSet) != nil) && (senha.rangeOfCharacter(from: regraCharEspecial as CharacterSet) != nil))
            {
                return true
            }
        return false
    }
    
    func validar(user: String, senha: String) -> Bool {
        
        if user.isEmpty {
            return false
            
        }
//        else if isValidEmail(testStr: senha){
//            return false
//        }

        if senha.isEmpty {
            print("Deu erro na senha")
            return false
        }else if regraSenha(senha: senha) == false{
            return false
        }
        return true
    }
    
    func login(user: String, senha: String) {
        service.login(user: user, password: senha) { user in
            self.navegarParaDetalhes(user: user)
            print("Funcao Login Ativado")
        }
        
    }

    
    func navegarParaDetalhes(user: Usuario) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetalheUsuarioViewController") as? DetalheUsuarioViewController {
            
            controller.usuario = user
            
         self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func didClickLogin(sender: UIButton) {
        //Recuperar o input o usuario
        let user = username.text!
        let senha = password.text!
        
        // Validar
        if validar(user: user, senha: senha) {
            login(user: user, senha: senha)
        } else {
            showAlert(message: "Senha e/ ou Usuario inválidos")
            print("Error ao validar")
        }
        
    }
    
    func showAlert(message:String ){
       
        let alert = UIAlertController(title: "Atention!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

