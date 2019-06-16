//
//  StatementViewController.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 15/06/19.
//  Copyright (c) 2019 Fernando Gomes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementDisplayLogic: class
{
  func updateViews(viewModel: Statements.get.ViewModel)
}

class StatementViewController: UIViewController, StatementDisplayLogic {
  var interactor: StatementBusinessLogic?
  var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    var statements: [Statement] = [] {
        didSet {
            DispatchQueue.main.async {
                // reload table view
            }
        }
    }


  // MARK: Object lifecycle
  
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
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = StatementInteractor()
    let presenter = StatementPresenter()
    let router = StatementRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
//    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
//  func doSomething()
//  {
//    let request = Statements.get.Request()
//    interactor?.doSomething(request: request)
//  }
  
  func updateViews(viewModel: Statements.get.ViewModel) {
    let uAccount = viewModel.userAccount!
    statements = viewModel.statements!
    
    // set text to views
    
  }
}
