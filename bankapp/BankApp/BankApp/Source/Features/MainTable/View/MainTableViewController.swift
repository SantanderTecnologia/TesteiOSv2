//
//  MainTableViewController.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private enum TableStyle: Int {
        case userInfo, statementItems
    }
    
    var presenter: MainTablePresenterDelegate? {
        didSet {
            presenter?.set(view: self)
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(as: UserInfoTableViewCell.self)
        tableView.registerCell(as: StatementItemTableViewCell.self)
        
        tableView.backgroundColor = .purple
        
        presenter?.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case TableStyle.userInfo.rawValue:
            return 1
        default:
            return presenter?.numberOfRows ?? 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case TableStyle.userInfo.rawValue:
            guard let cell = tableView.dequeueCell(as: UserInfoTableViewCell.self, forIndexPath: indexPath) else { return UITableViewCell() }
            cell.setup(user: presenter?.userName, account: presenter?.bankInfo, balance: presenter?.balanceInfo, delegate: self)
            return cell
        default:
            guard let cell = tableView.dequeueCell(as: StatementItemTableViewCell.self, forIndexPath: indexPath) else { return UITableViewCell() }
            cell.setup(info: presenter?.statement(for: indexPath.row))
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MainTableViewController: MainTableViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showAlert(message: String) {
        //
    }
}

protocol Logoutable: AnyObject {
    func logout()
}

extension MainTableViewController: Logoutable {
    func logout() {
        let alert = UIAlertController(title: "Atenção", message: "Deseja sair?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: { [weak self] action in
            self?.presenter?.logout()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
