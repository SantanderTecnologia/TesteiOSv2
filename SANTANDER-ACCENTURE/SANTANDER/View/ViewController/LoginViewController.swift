//
//  ViewController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, SomeUIViewDelegate, CoreDataDelegate {
    
    let coreData: CoreDataManager = CoreDataManager()
    var arrayPerson:[Person] = []
    
    func loginBtnTapped(name: String, passwd: String) {
        
    }
    
    @IBOutlet weak var loginTableView: UITableView!
    
    var login: LoginTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
        
        configureTableView()
        loadUser()
        loginTableView.reloadData()
    }
    
    func configureTableView() {
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        
    }
    
    func segueFunction() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "UsuarioViewController") as! StatementsViewController
        resultViewController.modalPresentationStyle = .fullScreen
        self.present(resultViewController, animated:true, completion:nil)
    }
    
    func loadUser() {
        coreData.loadInformation { [weak self] arrayPerson in
            self?.arrayPerson = arrayPerson
            self?.loginTableView.reloadData()
        }
    }
    
    func saveInformation(user: String, password: String) {
        coreData.saveInformation(user: user, password: password)
    }
}


extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let receberCell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as? LoginTableViewCell {
            
            receberCell.delegateSegue = self
            receberCell.delegateCoreData = self
            
            receberCell.layer.borderColor = UIColor.label.cgColor
            
            if arrayPerson.count > 0 {
                if let lastPerson = self.arrayPerson.last {
                    receberCell.setup(person: lastPerson)
                }
            }
            
            
            return receberCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    
    
}


extension LoginViewController: UserControllerDelegate{
    
    func successLoadUsers() {
        self.loginTableView.reloadData()
    }
    
    func errorLoadUsers(error: Error?) {
        
    }
}
