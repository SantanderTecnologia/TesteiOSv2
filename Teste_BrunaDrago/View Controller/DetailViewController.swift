//
//  DetailViewController.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 19/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    

    @IBOutlet weak var agencyNumberLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    var operations = [StatementList]()
    var detail:DetailService?
    var userData:LoginData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataView()
        setUPTableView()
        
        //Atribuir o delegate e o datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        //Chamando o método que irá fazer o GET dos dados das operações
        getData(userID: userData!.userid)
    }
    

    @IBAction func doLogoutButton(_ sender: Any) {
    
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    //Mark: - Método Get
    func getData(userID: Int){
        
            let urlJsonString = "https://bank-app-test.herokuapp.com/api/statements/\(userID)"
            
            let url = URL(string: urlJsonString)
            
            guard url != nil else {
                print("Erro na URL")
                return
            }
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let data = data else {return}
                
                do{
                    self.detail =  try JSONDecoder().decode(DetailService.self, from: data)
                    self.operations = self.detail?.statementList as! [StatementList]
                    
                }catch let jsonErr{
                    print("Error : \(jsonErr)")
                }
                DispatchQueue.main.async {
                    print(self.detail?.statementList.count)
                               self.tableView.reloadData()
                           }
                
            }.resume()
            
        }
    //Mark : - Método para carregar informações na tela
    func loadDataView(){
        if let name = userData?.name {
           clientNameLabel.text = name
        }
        if let accountNumber = userData?.account {
           accountNumberLabel.text = "\(accountNumber) /"
        }
        if let accountBalance = userData?.balance {
            //accountBalanceLabel.text = "R$\(accountBalance)"
            accountBalanceLabel.text = String(accountBalance.currencyFormat)
        }
        if var agency = userData?.agency {
            agency.insert(".", at:agency.index(agency.startIndex, offsetBy: 2))
            agency.insert("-", at:agency.index(agency.startIndex, offsetBy: 9))
            
            agencyNumberLabel.text = agency
        }
        
        
        }
     func setUPTableView(){
    
        tableView.separatorStyle = .singleLine
           tableView.showsVerticalScrollIndicator = false
       }
    }


extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionsTableViewCell
        
        cell.operationLabel.text = operations[indexPath.row].title
        
        //Formatando a data
        var t = operations[indexPath.row].date
        cell.dateLabel.text = t?.dateFormat
        
        cell.descriptionLabel.text = operations[indexPath.row].desc
        
        //Formatando a currência do valor
         let a = operations[indexPath.row].value
        cell.amountLabel.text = a?.currencyFormat
        
        return cell
    }
 }
