//
//  LoginTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

protocol PerformLoginDelegate: class {
    func loginBtnTapped(name: String, passwd:String)
}

protocol CoreDataDelegate: class {
    func saveInformation(user: String, password: String)
}

protocol SomeUIViewDelegate {
    func segueFunction() 
}

class LoginTableViewCell: UITableViewCell {
    
    var email = ""
    var password = ""
    
    var delegateSegue: SomeUIViewDelegate?
    
    var delegateCoreData: CoreDataDelegate?
    
    @IBOutlet weak var logoBancoImageView: UIImageView!
    
    @IBOutlet weak var nomeUsuarioTextField: UITextField!{
        didSet{
            nomeUsuarioTextField.placeholder = "User"
            nomeUsuarioTextField.layer.borderWidth = 1
            nomeUsuarioTextField.layer.borderColor = UIColor.lightGray.cgColor
            nomeUsuarioTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var senhaUsuarioTextField: UITextField!{
        didSet{
            senhaUsuarioTextField.layer.borderWidth = 1
            senhaUsuarioTextField.layer.borderColor = UIColor.lightGray.cgColor
            senhaUsuarioTextField.placeholder = "Password"
            senhaUsuarioTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
            loginButton.backgroundColor = UIColor(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
            loginButton.layer.shadowColor = loginButton.backgroundColor?.cgColor
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
            
        }
        
    }
    weak var delegate: PerformLoginDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nomeUsuarioTextField.delegate = self
        senhaUsuarioTextField.delegate = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(person: Person) {
        nomeUsuarioTextField.text = person.user ?? ""
        email = person.user ?? ""
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let user = nomeUsuarioTextField.text , let password = senhaUsuarioTextField.text else {
            return
        }
        let areValidFields = verifyIfValidFields()
        if areValidFields {
            delegate?.loginBtnTapped(name: user, passwd: password)
        } else {
            nomeUsuarioTextField.layer.borderColor = UIColor.red.cgColor
            senhaUsuarioTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        self.delegateSegue?.segueFunction()
        self.delegateCoreData?.saveInformation(user: user, password: password)
    }
    
    func verifyIfValidFields() -> Bool {
        guard let user = nomeUsuarioTextField.text , let password = senhaUsuarioTextField.text else {
            
            return false
        }
        if (String.validarEmail(email: user) || String.validarCPf(cpf: user)) && String.validarPassword(password) {
            return true
        }
        return false
    }
    
    func setupDefaultValuesOnDismiss(){
        nomeUsuarioTextField.placeholder = "User"
        senhaUsuarioTextField.placeholder = "Password"
        senhaUsuarioTextField.text = ""
    }
    
    func validatedTextField(textField: UITextField) {
        guard let texto = textField.text else { return }
        if textField == nomeUsuarioTextField {
            email = nomeUsuarioTextField.text ?? ""
            if String.validarCPf(cpf: texto) || String.validarEmail(email: texto) {
                textField.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        } else {
            password = senhaUsuarioTextField.text ?? ""
            if String.validarPassword(texto) {
                textField.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
        
        if (String.validarCPf(cpf: email) || String.validarEmail(email: email)) && String.validarPassword(password) {
            enableButton(button: loginButton, enabled: true)
        } else {
            enableButton(button: loginButton, enabled: false)
        }
        
    }
    
    func enableButton(button: UIButton, enabled: Bool) {
        if enabled {
            button.alpha = 1.0
            button.isEnabled = true
        } else {
            button.alpha = 0.5
            button.isEnabled = false
        }
    }
    
}


extension LoginTableViewCell: UITextFieldDelegate{
    
    @objc func textFieldDidChange(textField: UITextField) {
        validatedTextField(textField: textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nomeUsuarioTextField {
            senhaUsuarioTextField.becomeFirstResponder()
            return false
        }
        if textField == senhaUsuarioTextField{
            senhaUsuarioTextField.resignFirstResponder()
            return true
        }
        return true
    }
    
    
}





