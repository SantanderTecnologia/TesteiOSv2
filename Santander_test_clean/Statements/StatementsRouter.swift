
import UIKit

@objc protocol StatementsRoutingLogic
{}

protocol StatementsDataPassing
{
  var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing
{
  weak var viewController: StatementsViewController?
  var dataStore: StatementsDataStore?
}
