//
//  LoginViewController.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 19/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passowordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
     var userLoginInfo = userManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = userLoginInfo.getStored()
        
    
    }
    

    @IBAction func doLoginButton(_ sender: Any) {
        
        var user = userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var password = passowordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if user == nil && password == nil{
            return
        }
        
        // apagar senha do text field
        //userTextField.text = nil
        passowordTextField.text = nil
        
        
        var passIsValid = Password(password: password!).isValid()
        var userIsValid = UserValidation(user: user!).isValid()
        let userData = getLoginData().getData(user: user!, password: password!)
        
        var accessIsValid = false
        
        if userData.statusCode == 200{
            accessIsValid = true
        }
        
        
        
        if passIsValid  && userIsValid && accessIsValid{
            
            userLoginInfo.storeUser(user: user!)
            
            let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailViewController
            
            detailVC.userData = userData
            self.navigationController?.pushViewController(detailVC, animated: true)
        }else{
            showAlert()
        }
        
    }
    func showAlert(){
    
    //Criando alerta para informar usuário que a senha ou login é invalido
    let alerta = UIAlertController(title: "Login Inválido", message: "Usuário ou senha inválido", preferredStyle: .alert)
    
        //Adicionando Botões
        let acaoOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            print("Apertou o Ok")
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel) { (action) in
            
            print("Apertou Cancelar")
        }
        
        alerta.addAction(acaoOk)
        alerta.addAction(acaoCancelar)
        
        //Apresentando o alerta
        self.present(alerta, animated: true) {
            
            print("Apresentou o alerta")
        }
    }
    
}
