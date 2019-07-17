//
//  ViewController.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 05/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator

class PrimeiraViewController: UIViewController {
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let servico: LoginService = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logar(_ sender: UIButton) {
        validarUsuario(usuario: user.text!, senha: password.text!)
        logar2(user: user.text!, senha: password.text!)
    }
    
    
/*--- As validacoes ----------------------------------------------------------------------------------------*/
    func validarEmail(email: String) -> Bool{
        let padrao = Login.padroes.email.rawValue
        let predicate = NSPredicate(format: "SELF MATCHES %@", padrao as! CVarArg)
        return predicate.evaluate(with: email)
    }

    func validarCpf(cpf: String) ->Bool{
        let cpf = BooleanValidator().validate(cpf: "111.111.111-11")
        return true
    }

    func validarSenha(senha: String) -> Bool{
        let numero: NSCharacterSet = NSCharacterSet(charactersIn: Login.padroes.alfanumerico.rawValue)
        let lm: NSCharacterSet = NSCharacterSet(charactersIn: Login.padroes.letraMaiuscula.rawValue)
        let caracter: NSCharacterSet = NSCharacterSet(charactersIn: Login.padroes.caracterEsquisito.rawValue)
        
        if ((senha.rangeOfCharacter(from: numero as CharacterSet) != nil) && (senha.rangeOfCharacter(from: lm as CharacterSet) != nil) && (senha.rangeOfCharacter(from: caracter as CharacterSet) != nil)) {
            return true
        }
        return false
    }
/*-----------------------------------------------------------------------------------------------------------*/
    func logar2(user: String, senha: String){
        servico.login(user: user, password: senha){
            user in
            self.irParaDetalhes(user: user)
        }
    }
    
    func irParaDetalhes (user: Usuario){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SegundaViewController") as? SegundaViewController{
            controller.usuario = user
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
/*-----------------------------------------------------------------------------------------------------------*/
    func mostrarAlert(titulo: String, menssagem: String){
        let alerta = UIAlertController(title: titulo, message: menssagem, preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {(ACTION) in alerta.dismiss(animated: true, completion: nil)}))
        
        self.present(alerta, animated: true, completion: nil)
    }
    
    func validarUsuario(usuario: String, senha: String){
        
        if validarEmail(email: usuario){
            print("Email valido")
        }else{
            mostrarAlert(titulo: "Oh oh", menssagem: "Email invalido! Tente novamente")
            user.text = ""
        }
        /*---------------------------------------------------------------------------------*/
        if validarCpf(cpf: usuario){
            print("Cpf valido")
        }else{
            mostrarAlert(titulo: "Oh oh", menssagem: "CPF invalido! Tente novamente")
            user.text = ""
        }
        /*---------------------------------------------------------------------------------*/
        if validarSenha(senha: senha){
            print("Senha valida")
        }else{
            mostrarAlert(titulo: "Oh oh", menssagem: "Senha invalida! Tente novamente")
            user.text = ""
        }
    }
}


