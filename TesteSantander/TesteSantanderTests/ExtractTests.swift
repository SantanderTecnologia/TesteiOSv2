//
//  ExtractTests.swift
//  TesteSantanderTests
//
//  Created by Hugo Abolis Jordao on 18/06/19.
//  Copyright © 2019 Hugo Abolis Jordao. All rights reserved.
//

import XCTest
@testable import TesteSantander

class ExtractTests: XCTestCase {
    var interactor: ExtractInteractor?
    var viewController: ExtractViewController?

    override func setUp() {
        viewController = ExtractViewController()
        interactor = ExtractInteractor()
        let presenter = ExtractPresenter()
        viewController?.interactor = interactor
        interactor?.presenter = presenter
        presenter.viewController = viewController
    }

    override func tearDown() {
        interactor = nil
        viewController = nil
    }

    func testExtractInteractorGetStatementList(){
        //Given
        let worker = ExtractWorkerSpy()
        interactor?.userData = Login.Fetch.UserData(userId: 1, name: "teste", bankAccount: "000", agency: "000", balance: 0.00)
        interactor?.worker = worker
        
        //When
        interactor?.getStatementList()
        
        //Then
        XCTAssert(worker.didCallGetStatementList, "O método GetStatementsList no Interactor não utilizou o worker")
    }
    
    func testSetUserData(){
        //Given
        let presenterSpy = ExtractPresenterSpy()
        interactor?.presenter = presenterSpy
        interactor?.userData = Login.Fetch.UserData(userId: 1, name: "teste", bankAccount: "000", agency: "000", balance: 0.00)
        
        //When
        interactor?.setUserData()
        
        //Then
        XCTAssert(presenterSpy.didCallSetUserData, "O metodo setUserData no presenter nao foi chamado.")
    }
    
    func testExtractWorkerCheckResult(){
        //Given
        let responseModel = Extract.Fetch.Response(statementList: [Extract.Fetch.StatementItem(title: "title", desc: "desc", date: "date", value: 0.1)])
        let worker = ExtractWorker()
        let jsonEncoder = JSONEncoder()
        //When
        do{
            let jsonData = try jsonEncoder.encode(responseModel)
            worker.checkResult(isSuccsess: true, data: jsonData) { response in
                if response == nil{
                    XCTFail("Falha na decodificação do JSON")
                }
            }
        }catch{
            XCTFail("Falha codificando o JSON de teste \(error)")
        }
    }
    
    func testPresentStatementListSucces(){
        //Given
        let viewControllerSpy = ExtractViewControllerSpy()
        let presenter = ExtractPresenter()
        presenter.viewController = viewControllerSpy
        let response = Extract.Fetch.Response(statementList: [Extract.Fetch.StatementItem(title: "title", desc: "desc", date: "date", value: 0.0)])
        //When
        presenter.presentStatementList(response: response)
        
        //Then
        XCTAssert(viewControllerSpy.didCallDisplayStatementList, "Método displayStatement não foi chamado no presenter.")
    }
    
    func testPresentStatementListFail(){
        //Given
        let viewControllerSpy = ExtractViewControllerSpy()
        let presenter = ExtractPresenter()
        presenter.viewController = viewControllerSpy
        //When
        presenter.presentStatementList(response: nil)
        
        //Then
        XCTAssert(viewControllerSpy.didCallDisplayError, "Método displayErro não foi chamado no presenter.")
    }
    
    func testExtractPresenterSetUserData(){
        //Given
        let userData = Login.Fetch.UserData(userId: 1, name: "teste", bankAccount: "000", agency: "000", balance: 0.00)
        let viewControllerSpy = ExtractViewControllerSpy()
        let presenter = ExtractPresenter()
        presenter.viewController = viewControllerSpy
        
        //When
        presenter.setUserData(userData: userData)
        
        //Then
        XCTAssert(viewControllerSpy.didCallSetUserData, "Presenter nao chamou o método setUserData no viewController")
        
    }
    
    //MARK: Test Doubles
    
    class ExtractWorkerSpy: ExtractWorker{
        var didCallGetStatementList = false
        
        override func getStatementList(idUser: String, handler: @escaping ((Extract.Fetch.Response?) -> ())) {
            didCallGetStatementList = true
        }
    }
    
    class ExtractPresenterSpy: ExtractPresenter{
        var didCallSetUserData = false
        
        override func setUserData(userData: Login.Fetch.UserData) {
            didCallSetUserData = true
        }
    }
    
    class ExtractViewControllerSpy: ExtractViewController{
        var didCallDisplayStatementList = false
        var didCallDisplayError = false
        var didCallSetUserData = false
        
        override func displayStatementList(viewModel: Extract.Fetch.ViewModel) {
            didCallDisplayStatementList = true
        }
        
        override func displayError(errorMessage: String) {
            didCallDisplayError = true
        }
        
        override func setUserData(userName: String, userAccount: String, userBalance: String) {
            didCallSetUserData = true
        }
    }

}
