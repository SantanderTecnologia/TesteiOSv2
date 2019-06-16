//
//  ViewController.swift
//  Bank App
//
//  Created by Gustavo on 6/5/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    //Defição da variaveis UI login and senha
        @IBOutlet var login: UITextField!
        @IBOutlet var senha: UITextField!
        @IBOutlet var loginbutton: UIButton!
    
    
    //Outras Variáveis
        var nameArray = [String]()
        var name:String=""
        var agency:String=""
        var bankAccount:String=""
        var balance:NSNumber=0
        var userId:Int=0
    
        
    
    //Inicializaçao
    override func viewDidLoad() {
        super.viewDidLoad()
      self.hideKeyboardWhenTappedAround()
    //Arredondar bordas do botao
        loginbutton.layer.cornerRadius = 0.05 * loginbutton.bounds.size.width
        loginbutton.clipsToBounds = true
    }
    

    //Funcao Botao ao pressionar Login
    @IBAction func login(_ sender: Any) {
        let user:String=login.text!
        let password:String=senha.text!
        
        
    //Verifica se os campos nao estao vazios
        if user.isEmpty || password.isEmpty {
        displayalert(usermessage: "Os campos Email ou CPF e senha devem ser preenchidos")
            return
        }
       
    //Verifica se user é CPF ou email
        if user.isValidEmail()||CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: user)) {

        }else {
        displayalert(usermessage: "Deve ser digitado um email ou CPF valido")
            return
        }
        
   
     //Verifica condicao de senha
        
        if password.validatep(password: password) {

        }else {
            displayalert(usermessage: "A senha deve conter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
            return
        }
        
        
       

 //Chamar Função downloadjson com os dados

        let f=downloadjson()
          name=f.name
          agency=f.agency
          bankAccount=f.bankAccount
          balance=f.balance
          userId=f.userId
      
      
//Esperar 2 segundos ate HTTP download.Não é a melhor forma
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           self.performSegue(withIdentifier: "siga", sender: self)
        }
        
     
}
    
//Função Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc=segue.destination as! currency
        vc.id=self.userId
        vc.nsaldo=self.balance
        vc.nconta=self.bankAccount
        vc.nome=self.name
        vc.nagencia=self.agency
    }
    
//Funcao para obter dados do JSON
//Usando o codigo gerado pelo code snipp do Postman e Swift 3. Não tive sucesso com Swift 4 apesar de muito mais simples para Parse Json
    func downloadjson() ->(name:String, agency:String, bankAccount:String, balance: NSNumber, userId:Int) {
   

    let headers = [
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "PostmanRuntime/7.13.0",
        "Accept": "*/*",
        "Cache-Control": "no-cache",
        "Postman-Token": "d9e0cf48-b6e0-4e49-aaf4-5f94d8fef529,56c04799-bdd0-4db3-a8e3-90005959f7cc",
        "Host": "bank-app-test.herokuapp.com",
        "accept-encoding": "gzip, deflate",
        "content-length": "32",
        "Connection": "keep-alive",
        "cache-control": "no-cache"
    ]
    
    let postData = NSMutableData(data: "user=test_user".data(using: String.Encoding.utf8)!)
    postData.append("&password=Test@1".data(using: String.Encoding.utf8)!)
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://bank-app-test.herokuapp.com/api/login")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let user:String=login.text!
    let password:String=senha.text!
    let paramToSend = "user=" + user + "&password=" + password
    request.httpBody = paramToSend.data(using: String.Encoding.utf8)
    

    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      
        if (error != nil) {
            print(error as Any)
            self.displayalert(usermessage: "Falha de Conexão")
            return
            
        } else {
            let httpResponse = response as? HTTPURLResponse
             print(httpResponse as Any)
            let httpdata = data
              print(httpdata as Any)
        }
   //Carregar dados do Json
        if let data = data {
            do {
              let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                print((json as AnyObject).value(forKey: "userAccount")!)
               
                let lista = (json as AnyObject).value(forKey: "userAccount")
                
                let dict = lista as? NSDictionary
                let name1  = dict!.value(forKey: "name") as? String
                let agency1 = dict!.value(forKey: "agency") as? String
                let balance1 = dict!.value(forKey: "balance") as? NSNumber
                let userId1 = dict!.value(forKey: "userId") as? Int
                let bankAccount1 = dict!.value(forKey: "bankAccount") as? String
                
                self.name = name1!
                self.agency=agency1!
                self.balance=balance1!
                self.userId=userId1!
                self.bankAccount=bankAccount1!
                
            
         
            } catch {
               print(error)
            }
        }
        
        
    })
    
    
     dataTask.resume()

 return(name, agency, bankAccount, balance, userId)

}

 
    
}//Fim Class ViewController



