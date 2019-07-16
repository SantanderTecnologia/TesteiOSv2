//
//  ViewController.swift
//  bank
//
//  Created by mayara.da.s.andrade on 04/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    let service: LoginService = BancoAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func validar(user:String , senha: String ) -> Bool {
        if user.isEmpty{
            return false
        }
        if senha.isEmpty{
            return false
        }
        return true
    
}
    func login(user: String, senha: String) {
        service.login(user: user, password: senha) { user in
            self.navegarParaDetalhes(user: user)
        }
    }
    
    func navegarParaDetalhes(user: Usuario) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetalheUsuarioViewController") as?  DetalheUsuarioViewController {
            
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
            print("Error ao validar")
        }
    }
}


