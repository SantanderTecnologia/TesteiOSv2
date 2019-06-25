
import UIKit

@objc protocol LoginRoutingLogic
{
  func routeToStratum(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get set }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
    
  func routeToStratum(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! StatementsViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    }
  }
  func passDataToSomewhere(source: LoginDataStore, destination: inout StatementsDataStore)
  {
    destination.userAccount = source.userAccount
  }
}
