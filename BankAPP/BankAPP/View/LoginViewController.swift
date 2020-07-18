//
//  ViewController.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 28/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import UIKit

enum LoginType {
    case email, cpf
}

class LoginViewController: UIViewController {
    
    let viewModel = CurrencyViewModel(apiManager: ApiManager())
    var userLogin = [DataUser]()
    var dataUser: DataUser?
    var isRegisteredUser = false
    var isValidUser: Bool = false
    var isValidPassword: Bool = false
    var textLenght: String = ""
    var loginType: LoginType = .cpf
    let messagesErrorAlert: [String] = [
        "Você inseriu algum dado incorreto, por favor digite um login ou senha válida. Seguir a regra para senha: 8 digitos com pelo menos uma letra maiúscula, um caracter especial e um caracter alfanumérico",
        "O usuário inserido não está registrado!",
        "Todos os campos devem ser preenchidos!"
    ]
    
    lazy var imageViewLogo: UIImageView = {
        let v = UIImageView(image: UIImage(named: "Logo"))
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var textFieldUser: UITextField = {
        let v = UITextField(frame: .zero)
        v.keyboardType = .alphabet
        v.keyboardAppearance = .light
        v.font = UIFont().fontAppDefault(size: 15)
        v.textColor = .colorLightGray
        v.backgroundColor = .white
        v.borderStyle = .none
        v.textAlignment = .left
        v.layer.masksToBounds = true
        v.tintColor = .colorLightGray
        v.layer.cornerRadius = 4
        v.layer.borderWidth = 1
        v.delegate = self
        v.layer.borderColor = UIColor.colorBorder.cgColor
        v.attributedPlaceholder = NSAttributedString(string: "User", attributes: [NSAttributedString.Key.font : UIFont().fontAppDefault(size: 15)])
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var textFieldPassword: UITextField = {
        let v = UITextField(frame: .zero)
        v.keyboardType = .alphabet
        v.keyboardAppearance = .light
        v.font = UIFont().fontAppDefault(size: 15)
        v.textColor = .colorLightGray
        v.backgroundColor = .white
        v.borderStyle = .none
        v.textAlignment = .left
        v.layer.masksToBounds = true
        v.tintColor = .colorLightGray
        v.layer.cornerRadius = 4
        v.layer.borderWidth = 1
        v.delegate = self
        v.layer.borderColor = UIColor.colorBorder.cgColor
        v.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font : UIFont().fontAppDefault(size: 15)])
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var buttonLogin: UIButton = {
        let v = UIButton()
        v.setTitle("Login", for: .normal)
        v.titleLabel?.font = UIFont().fontAppDefault(size: 16)
        v.setTitleColor(UIColor.colorWhiteBkg, for: .normal)
        v.backgroundColor = .colorBlueBkg
        v.layer.cornerRadius = 4
        v.layer.masksToBounds = true
        v.layer.shadowRadius = 1
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: 4)
        v.layer.shadowColor = UIColor.colorBlueBkg.cgColor
        v.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutUI()
        loadContentLogin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadLastUserLogged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLastUserLogged()
        textFieldPassword.text = ""
    }
    
    private func loadLastUserLogged() {
        if viewModel.loadUsuarioLogged() != nil {
            textFieldUser.becomeFirstResponder()
            textFieldUser.text = viewModel.loadUsuarioLogged()?.email ?? ""
            textFieldUser.resignFirstResponder()
        }else {
            textFieldUser.text = ""
            textFieldUser.becomeFirstResponder()
            textFieldUser.resignFirstResponder()
        }
    }
    
    private func loadContentLogin() {
        viewModel.loadLogin { (error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.userLogin = self.viewModel.userAccount
                }else{
                    self.showError(buttonLabel: "OK", titleError: "ATENÇÃO!", messageError: "Houve algum problema ao carregar os dados, tente novamente!")
                }
            }
        }
    }
    
    private func validateTextField(_ text: String, _ textField: UITextField){
        
        if text != "" {
            
            if textField.isEqual(textFieldUser) {
                if text.isString {
                    loginType = .email
                }else {
                    loginType = .cpf
                }
                (isRegisteredUser, dataUser) = viewModel.checkIsValidLogin(loginType: loginType, user: text)
                
                switch loginType {
                case .cpf:
                    isValidUser = (textLenght.count == 11) ? true : false
                    textField.text = text.applyFormatNumbersCPF(pattern: "xxx.xxx.xxx-xx", replacmentCharacter: "x")
                    break
                default:
                    isValidUser = ValidateEmail.validate(email: text)
                    break
                }
            }else {
                isValidPassword = ValidatePassword.validpassword(password: text)
            }
        }
    }
    
    @objc func goToLogin() {
        
        if textFieldUser.text != "" && textFieldPassword.text != "" {
            if isValidUser && isValidPassword && isRegisteredUser {
                let vc = ListCurrencyViewController(viewModel: viewModel)
                vc.modalPresentationStyle = .fullScreen
                vc.dataUserLoged = dataUser
                present(vc, animated: true, completion: nil)
                
            }else if !(isValidUser || isValidPassword) {
                self.showError(buttonLabel: "OK", titleError: "ATENÇÃO!", messageError: messagesErrorAlert[0])
                
            }else if !(isRegisteredUser) {
                self.showError(buttonLabel: "OK", titleError: "ATENÇÃO!", messageError: messagesErrorAlert[1])
            }
        }else {
            self.showError(buttonLabel: "OK", titleError: "ATENÇÃO!", messageError: messagesErrorAlert[2])
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupLayoutUI() {
        view.backgroundColor = .white
        view.addSubview(imageViewLogo)
        view.addSubview(textFieldUser)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        
        var topanchor: NSLayoutYAxisAnchor
        var bottomanchor: NSLayoutYAxisAnchor
        
        if #available(iOS 11, *) {
            topanchor = view.safeAreaLayoutGuide.topAnchor
            bottomanchor = view.safeAreaLayoutGuide.bottomAnchor
        }else{
            topanchor = view.topAnchor
            bottomanchor = view.bottomAnchor
        }
        
        NSLayoutConstraint.activate([
            imageViewLogo.topAnchor.constraint(equalTo: topanchor, constant: 56),
            imageViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            imageViewLogo.heightAnchor.constraint(equalToConstant: 70),
            imageViewLogo.widthAnchor.constraint(equalToConstant: 125)
        ])
        NSLayoutConstraint.activate([
            textFieldUser.topAnchor.constraint(equalTo: imageViewLogo.bottomAnchor, constant: 105),
            textFieldUser.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            textFieldUser.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textFieldUser.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            textFieldPassword.topAnchor.constraint(equalTo: textFieldUser.bottomAnchor, constant: 21),
            textFieldPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            textFieldPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            buttonLogin.bottomAnchor.constraint(equalTo: bottomanchor, constant: -33),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonLogin.heightAnchor.constraint(equalToConstant: 62),
            buttonLogin.widthAnchor.constraint(equalToConstant: 202)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    
    @discardableResult func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.isEqual(textFieldUser) {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else {return false}
            textLenght = currentText.replacingCharacters(in: stringRange, with: string)
        }
        return true
    }
    
    @discardableResult func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateTextField(textField.text ?? "", textField)
        return true
    }
    
    @discardableResult func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(textFieldUser) {
            textFieldUser.resignFirstResponder()
            textFieldPassword.becomeFirstResponder()
        }else{
            textFieldPassword.resignFirstResponder()
        }
        return true
    }
}
