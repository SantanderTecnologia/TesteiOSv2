//
//  UIViewController+Toast.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 18/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation
import SVProgressHUD

extension UIViewController {
    
    
    // MARK: - Toast
    
    public func toast() {
        SVProgressHUD.show()
    }
    
    public func toast(withMessage message: String) {
        SVProgressHUD.show(withStatus: message)
    }
    
    public func toast(withSuccessMessage message: String) {
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    public func toast(withErrorMessage errorMessage: String) {
        SVProgressHUD.showError(withStatus: errorMessage)
    }
    
    public func toastEnd() {
        SVProgressHUD.dismiss()
    }
    
}
