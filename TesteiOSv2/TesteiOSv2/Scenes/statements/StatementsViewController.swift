//
//  StatementsViewController.swift
//  TesteiOSv2
//
//  Created by Foliveira on 10/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import UIKit

class StatementsViewController: UIViewController {
    


    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var contaLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var StatementsTableView: UITableView!
    
    var interactor: StatementsInteractorProtocol?
    var userAccount: UserInfo?
    var statements = [Statement]()

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        let controller = self
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.controller = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StatementsTableView.delegate = self
        StatementsTableView.dataSource = self
        StatementsTableView.register(UINib(nibName: "StatementsTableViewCell", bundle: nil), forCellReuseIdentifier: "StatementsCell")
        StatementsTableView.reloadData()
        
        saldoLabel.text = "R$\(String(format:"%.2f", userAccount?.balance as! Double))"
        contaLabel.text = userAccount?.bankAccount
        userNameLabel.text = userAccount?.name
        
        // Do any additional setup after loading the view.
        
        if let userId = userAccount?.userId {
            interactor?.fetchUserData(userId: "\(userId)")
        }
            
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        SecureAPI.logout()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
}
