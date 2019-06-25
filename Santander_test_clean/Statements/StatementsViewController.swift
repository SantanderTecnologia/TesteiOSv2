
import UIKit

protocol StatementsDisplayLogic: class
{
    func showUserAccount(user: UserAccount, dataAccount: String)
    func listStantement(stantement: [Statemeant])
}


class StatementsViewController: UIViewController, StatementsDisplayLogic
{
    
    private var stantements = [Statemeant]()
    @IBOutlet weak var tableViewStratum: UITableView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAccountAgency: UILabel!
    @IBOutlet weak var lbBalance: UILabel!
    let cellId = "StatementCell"
    

    func showUserAccount(user: UserAccount, dataAccount: String) {
        if  let name = user.name,
            let balance = user.balance {
            lbName.text = name
            lbAccountAgency.text = dataAccount
            lbBalance.text = balance.toCurrency
        }
    }
    
  var interactor: StatementsBusinessLogic?
  var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
    
    func listStantement(stantement: [Statemeant]) {
        self.stantements = stantement
        tableViewStratum.reloadData()
    }
    

  private func setup()
  {
    let viewController = self
    let presenter = StatementsPresenter()
    let interactor = StatementsInteractor()
    let router = StatementsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        requestStatements()
        setupTable()
    }
    
    func setupTable() {
        tableViewStratum.delegate = self
        tableViewStratum.dataSource = self
        tableViewStratum.separatorStyle = .none
        tableViewStratum.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.8901960784, alpha: 0.3)
        tableViewStratum.rowHeight = UITableView.automaticDimension
        tableViewStratum.estimatedRowHeight = 104
        let uiNib = UINib(nibName: "StatementTableViewCell", bundle: nil)
        tableViewStratum.register(uiNib, forCellReuseIdentifier: cellId)
        tableViewStratum.layoutIfNeeded()

    }

    
  func requestStatements(){
    interactor?.requestStatements()
  }
}

extension StatementsViewController: UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stantements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? StatementTableViewCell else {
            return UITableViewCell()
        }
        cell.statemeant = stantements[indexPath.item]
        return cell

    }
}
