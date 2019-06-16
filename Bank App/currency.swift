//
//  currency.swift
//  Bank App
//
//  Created by Gustavo on 6/6/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit


class currency: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    //Definição variáveis UI
    @IBOutlet var nomedocliente: UILabel!
    @IBOutlet var numerodaconta: UILabel!
    @IBOutlet var saldo: UILabel!
  
    
    //Variaveis vinda do segue
    var id: Int=0;
    var nome: String="";
    var nconta: String="";
    var nagencia: String="";
    var nsaldo: NSNumber=0.0;
    
    //Definição dos Arrays do Tableview
    var title1=[String]()
    var desc = [String]()
    var date = [String]()
    var value = [NSNumber]()

    
    @IBOutlet var tableView: UITableView!
    
    //Load Inicial
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         downloadjson2()
         numerodaconta.text="\(nagencia) - \(nconta)"
         nomedocliente.text=nome
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        saldo.text=formatter.string(from: nsaldo)
         self.tableView.reloadData()
       
    }
    
    override  func didReceiveMemoryWarning() {
        //Caso seja necessario disposal
    }
    
    func downloadjson2(){
        //utilizando o snip coding do Postman e requisitando o userid enviado pelo segue
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "Postman-Token": "3d915062-507a-4e6a-af19-5d75f33c4591"
        ]
        let link:String="https://bank-app-test.herokuapp.com/api/statements/"+"\(id)"
        print(link)
        
        let request = NSMutableURLRequest(url: NSURL(string: link)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "statementList") as Any)
                
                if let vArray = jsonObj!.value(forKey: "statementList") as? NSArray {
                    for v in vArray{
                        if let vDict = v as? NSDictionary {
                            if let name = vDict.value(forKey: "title")  {
                                 self.title1.append(name as! String)
                                    print(name)
                            }
                            if let name = vDict.value(forKey: "desc") as? String  {
                                self.desc.append(name)
                            }
                            if let name = vDict.value(forKey: "date") as? String  {
                                self.date.append(name)
                            }
                            
                            if let name = vDict.value(forKey: "value") as? NSNumber  {
                                self.value.append(name)
                            }
                            
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
     
    })
        
        
    dataTask.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell") as! customcell
       
        cell1.pagamento.text=self.desc[indexPath.row]
        cell1.tipopagamento.text=self.title1[indexPath.row]
        cell1.data.text=self.date[indexPath.row]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        cell1.valor.text = formatter.string(from: self.value[indexPath.row])
        

       return cell1
        
    }
  
    // Largura da Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //Função Retorno Botao
    @IBAction func returnbutton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }
    
}
