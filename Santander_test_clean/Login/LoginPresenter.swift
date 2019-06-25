
import UIKit

protocol LoginPresentationLogic
{
    func dataUserValid(data: UserAccount)
    func buttonIsEnable(isValid: Bool, color: UIColor)
    func alertValidUser(result: Bool)
}

class LoginPresenter: LoginPresentationLogic
{
    
    
    weak var viewController: LoginDisplayLogic!
    
    func alertValidUser(result: Bool) {
        viewController?.alertValidUser(result: result)
    }
   
    func buttonIsEnable(isValid: Bool, color: UIColor) {
        viewController?.minLengthTextField(isValidButton: isValid, color: color)
    }
    
    func dataUserValid(data: UserAccount) {
        viewController?.validUser(dataUser: data)
    }
}
