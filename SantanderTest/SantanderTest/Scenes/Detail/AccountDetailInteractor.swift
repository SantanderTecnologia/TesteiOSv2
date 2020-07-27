//
//  AccountDetailInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol AccountDetailBusinessLogic {
    func retrieveStaments()
    var height: CGFloat { get }
    func numberOfRows(in section: Int) -> Int
    func header(tableView: UITableView, section: Int) -> UIView
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

protocol AccountDetailDataStore {
    var user: UserAccount? { get set }
}

class AccountDetailInteractor: AccountDetailBusinessLogic,AccountDetailDataStore {
    
    var user: UserAccount?
    
    var presenter: AccountDetailPresentationLogic?
    var worker: AccountDetailNetworkLogic
    
    var statments: [StatementList]
    
    var height: CGFloat {
        return 96.0
    }
    
    init(with worker: AccountDetailNetworkLogic = AccountDetailWorker()) {
        self.worker = worker
        statments = []
    }
    
    func retrieveStaments() {
        worker.retrieveStatments(for: 1).done(handleSuccess).catch(handleError).finally { [weak self] in
            self?.presenter?.shouldPresentLoading(false)
        }
    }
    
    //MARK: -
    //MARK: - HANDLE SUCCESS
    func handleSuccess(response: AccountDetail.Response) {
        presenter?.shouldPresentLoading(false)
        if let error = response.error?.message {
            presenter?.onError(title: Strings.Error.alertTitle, message: error)
        } else {
            statments = response.statementList ?? []
            presenter?.presentData()
        }
    }
    
    //MARK: -
    //MARK: - HANDLE ERROR
    func handleError(error: Error) {
        presenter?.onError(title: Strings.Error.alertTitle, message: error.localizedDescription)
    }
    
    func numberOfRows(in section: Int) -> Int {
        if section == 1 {
            return statments.count
        }
        return 0
    }
    
    func configureHeaderViewModel(at section: Int) -> AccountDetail.TableViewModel.Section? {
        if section == 0 {
            let vm = AccountDetail.TableViewModel.Section(user: user)
            return vm
        }
        return nil
    }
    
    func header(tableView: UITableView, section: Int) -> UIView {
        if section == 1 {
            let rect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80)
            let sectionView = StatmentSectionView(frame: rect)
            sectionView.set(text: Strings.Statment.Section.sectionTitle)
            return sectionView
        }
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 230)
        let headerView = StatmentHeaderView(frame: rect)
        if let vm = configureHeaderViewModel(at: 0) {
            headerView.set(vm: vm, handler: logout)
        }
        return headerView
    }
    
    func configureViewModel(at indexPath: IndexPath) -> AccountDetail.TableViewModel.Cell? {
        if indexPath.section == 1 {
            let statment = statments[indexPath.row]
            let vm = AccountDetail.TableViewModel.Cell(statment: statment)
            return vm
        }
        return nil
    }
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(StatementCell.self)
            if let vm = configureViewModel(at: indexPath) {
                cell.set(vm: vm)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func logout() {
        presenter?.performLogout()
    }
}
