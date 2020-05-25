//
//  HomePresenter.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    var viewModel: HomeViewModel? { get set }
    func homeViewDidLoad()
    func performLogout()
    func cleanup()
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    var viewModel: HomeViewModel?
    

    func performLogout(){
        let logoutAction = (UIAlertAction(title: "Home.LogoutButton".localized, style: UIAlertAction.Style.default, handler: { (_) -> Void in
            self.interactor?.performLogout()
            self.view?.dismiss(animated: true, completion: nil)
        }))
        
        let cancelAction = (UIAlertAction(title: "Home.CancelLogoutButton".localized, style: UIAlertAction.Style.default, handler: nil))
        
        self.view?.showAlertWith(title: "Home.LogoutTitle".localized, message: "Home.LogoutDescription".localized, actions: [logoutAction, cancelAction])
    }
    
    func homeViewDidLoad() {
        self.view?.showLoader()
        
        self.interactor?.getHomeData(completion: { (homeInteractorModel:HomeInteractorModel?, error: HomeInteractorError?) -> Void in
            if let homeInteractorModel = homeInteractorModel {
                self.viewModel = HomeViewModel(homeInteractorModel: homeInteractorModel)
                DispatchQueue.main.async {
                    //Update header section
                    self.view?.accountNumberLabel.text = self.viewModel?.user?.accountNumber
                    if let balance = self.viewModel?.user?.balance{
                        self.view?.balanceValueLabel.text = balance
                    }else{
                        self.view?.balanceValueLabel.text = "-" // default display value in case of a error
                    }
                    self.view?.usernameLabel.text = self.viewModel?.user?.name
                    
                    //Update list
                    self.view?.tableview?.reloadData()
                    
                    self.view?.hideLoader()
                }
            }else{
                if let error = error {
                    switch error {
                    case .internetError:
                         DispatchQueue.main.async {
                            self.view?.handleError(message: "noInternetError".localized, actions: [UIAlertAction(title: "tryAgain".localized, style: UIAlertAction.Style.default, handler: { (_) -> Void in
                                self.view?.refresh()
                            })])
                         }
                        return
                    default:
                        return
                    }
                }
                //TODO handle error
            }
        })
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
