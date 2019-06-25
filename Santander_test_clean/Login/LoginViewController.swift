
import UIKit
import Foundation
protocol LoginDisplayLogic: class
{
    func validUser(dataUser: UserAccount)
    func minLengthTextField(isValidButton: Bool, color: UIColor)
    func alertValidUser(result: Bool)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
    func alertValidUser(result: Bool) {
        lbAlert.isHidden = result
    }
    
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txfUser: SDTextField!
    @IBOutlet weak var txfPassword: SDTextField!
    @IBOutlet weak var lbAlert: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
    
    
    private func setup()
  {
    let viewController = self
    let presenter = LoginPresenter()
    let interactor = LoginInteractor()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonLogin()
    setupLbAlert()
    txfPassword.delegate = self
    txfUser.delegate = self
    let userDefault = UserDefaults.standard.string(forKey: "user")
    txfUser.text = userDefault
    txfPassword.isSecureTextEntry = true
    btnLogin.isEnabled = true
    }
    
    func setupLbAlert() {
        lbAlert.text = "user or password invalid"
        lbAlert.textColor = .red
        lbAlert.font = UIFont.systemFont(ofSize: 16)
        lbAlert.isHidden = true
    }
    
    func buttonLogin() {
        btnLogin.isEnabled = false
        btnLogin.layer.cornerRadius = 4
        btnLogin.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.231372549, green: 0.2823529412, blue: 0.9333333333, alpha: 0.8895703125))
    }

    @IBAction func actionCheckUser(_ sender: Any) {
        if let user = txfUser.text, let password = txfPassword.text {
            UserDefaults.standard.set(user, forKey: "user")
            interactor?.checkUser(user: user, password: password)
        }
    }
    
    func minLengthTextField(isValidButton: Bool, color: UIColor) {
        btnLogin.isEnabled = isValidButton
        btnLogin.backgroundColor = color
    }
    
    func validUser(dataUser: UserAccount) {
        router?.dataStore?.userAccount = dataUser
        self.performSegue(withIdentifier: "Stratum", sender: nil)
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        interactor?.buttonIsEnable(user: self.txfUser.isMatchSize, password: self.txfPassword.isMatchSize)
        return true
    }
    
}
