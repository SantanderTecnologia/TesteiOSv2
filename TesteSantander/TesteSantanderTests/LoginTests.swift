//
//  TesteSantanderTests.swift
//  TesteSantanderTests
//
//  Created by Hugo Abolis Jordao on 18/06/19.
//  Copyright © 2019 Hugo Abolis Jordao. All rights reserved.
//

import XCTest
@testable import TesteSantander
import Alamofire


class LoginTests: XCTestCase {
    
    var interactor: LoginInteractor!
    var worker: LoginWorker!
    var viewController: LoginViewController!
    var window: UIWindow!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        window = UIWindow()
        interactor = LoginInteractor()
        worker = LoginWorker()
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        interactor = nil
        worker = nil
        viewController = nil
        window = nil
    }
    
    func testLoginInteractorValidationSuccess(){
        //Given
        let loginData = [("688.540.510-80","A1!"), ("26689306003","Teste1234#"), ("teste@teste.com","123*A"), ("@.","WWW!2"), ("teste@teste.com","apenasMais1T#ste")]
        var status = (true, "user", "pass")
        //When
        loginData.forEach { (arg) in
            let (user, pass) = arg
            let result = interactor.validateData(user: user, pass: pass)
            if result != nil{
            status = (false, arg.0, arg.1)
            }
        }
        //Then
        var message = ""
        if !status.0 {
            message = "caso de teste: user \(status.1) senha \(status.2)"
        }
        XCTAssert(status.0, "Falha na validação de sucesso do login \(message)")
    }
    
    func testLoginInteractorValidationFail(){
        //Given
        let loginData = [("688.540.510-8","A1!"), ("266893060031212","Teste1234#"), ("teste#teste.com","123*A"), ("teste@teste","WWW!2"), ("teste@teste.com","1234"), ("teste@teste.com","a#2"), ("teste@teste.com","Teste1")]
        var status = (true, "user", "pass")
        //When
        loginData.forEach { (arg) in
            let (user, pass) = arg
            let result = interactor.validateData(user: user, pass: pass)
            if result == nil{
                status = (false, arg.0, arg.1)
            }
        }
        //Then
        var message = ""
        if !status.0 {
            message = "caso de teste: user \(status.1) senha \(status.2)"
        }
        XCTAssert(status.0, "Falha na validação de falha do login \(message)")
    }
    
    func testLoginIteractorLogUserIn(){
        //Given
        let sut = LoginInteractor()
        sut.worker = LoginWorkerSpy()
        //When
        sut.logUserIn(request: Login.Fetch.Request(data: ["user":"teste@test.com", "password":"1234A@"]))
        //Then
        XCTAssert(((sut.worker) as! LoginWorkerSpy ).loginWorkerCalled, "")
    }
    
    func testLoginInteractorWorker(){
        //Given
        let responseModel = Login.Fetch.Response(userAccount: Login.Fetch.UserData(userId: 0, name: "name", bankAccount: "00000", agency: "00", balance: 0.1), error: nil)
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
    
    func testLoginPresenterSuccess(){
        //Given
        let sut = LoginPresenter()
        let spyViewController = LoginViewControllerSpy()
        sut.viewController = spyViewController
        let response = Login.Fetch.Response(userAccount: Login.Fetch.UserData(userId: 0, name: "jose", bankAccount: "0000", agency: "00", balance: 0.0), error: nil)
    
        //When
        sut.presentLoginAttempt(response: response)
        
        //Then
        XCTAssert((sut.viewController as! LoginViewControllerSpy).didCallDisplaySuccess, "Falha ao chamar displaySuccess no LoginViewController")
        
        XCTAssert(!(sut.viewController as! LoginViewControllerSpy).didCallDisplayError, "Falha ao chamar didCallDisplaySuccess no displayError")
        
    }
    
    func testLoginPresenterFail(){
        //Given
        let sut = LoginPresenter()
        let spyViewController = LoginViewControllerSpy()
        sut.viewController = spyViewController
        let response = Login.Fetch.Response(userAccount: nil, error: Login.Fetch.ErrorData(code: 0, message: "error"))
        
        //When
        sut.presentLoginAttempt(response: response)
        
        //Then
        XCTAssert((sut.viewController as! LoginViewControllerSpy).didCallDisplayError, "Falha ao chamar displayError no LoginViewController")
        
        XCTAssert(!(sut.viewController as! LoginViewControllerSpy).didCallDisplaySuccess, "Falha ao chamar displaySuccess no LoginViewController")
    }
    
    func testLoginInteractorCheckSavedLogin(){
        //Given
        let viewController = LoginViewController()
        let interactor = LoginInteractorSpy()
        viewController.interactor = interactor
        
        //When
        viewController.checkSavedLogin()
        
        //Then
        XCTAssert(interactor.didCallCheckSavedLogin, "Não foi chamado o metodo do Interactor(checkSavedLogin) no ViewDidLoad")
        
    }
    
    func testLoginInteractorSaveLoginData(){
        //Given
        let userData = Login.Fetch.UserLoginData(user: "teste@teste.com", password: "A@123")
        let interactor = LoginInteractor()
        
        //when
        let status: Bool = interactor.saveLoginData(loginData: userData)
        
        XCTAssert(status, "")
    }
    
    func testLoginPresenterPresentSavedLogin(){
        //Given
        let presenter = LoginPresenter()
        let viewController = LoginViewControllerSpy()
        presenter.viewController = viewController
        
        //When
        presenter.presentSavedLogin(loginData: Login.Fetch.UserLoginData(user: "teste@teste.com", password: "!123A"))
        
        //Then
        XCTAssert(viewController.didCallDisplaySavedLogin, "Presenter não chamou presentSavedLogin")
    }
    
    func testLoginRouterRouteToExtractVC(){
        //Given
        let userData = Login.Fetch.UserData(userId: 10, name: "Teste", bankAccount: "00000", agency: "000", balance: 13.1)
        let routerSpy = LoginRouterSpy()
        
        viewController.interactor = interactor
        viewController.router = routerSpy
        routerSpy.viewController = viewController
        routerSpy.dataStore = interactor
        
        
        //When
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
        viewController.displaySuccess(viewModel: Login.Fetch.ViewModel(userAccount: userData, errorMessage: nil))
        
        XCTAssert(routerSpy.didCallRouteToExtractVC, "O metodo de transição de tela para ExtractViewController não foi chamado.")
        
    }
    
    
    
    // MARK: - Spy Classes
    class LoginWorkerSpy: LoginWorker{
        var loginWorkerCalled = false
        
        override func login(user: String, password: String, handler: @escaping ((Login.Fetch.Response?) -> ())) {
            loginWorkerCalled = true
        }
    }
    
    class LoginViewControllerSpy: LoginViewController{
        var didCallDisplayError = false
        var didCallDisplaySuccess = false
        var didCallDisplaySavedLogin = false
        
        
        override func displaySuccess(viewModel: Login.Fetch.ViewModel) {
            didCallDisplaySuccess = true
        }
        
        override func displayError(viewModel: Login.Fetch.ViewModel) {
            didCallDisplayError = true
        }
        
        override func displaySavedLogin(loginData: Login.Fetch.UserLoginData) {
            didCallDisplaySavedLogin = true
        }
    }
    
    class LoginInteractorSpy: LoginInteractor{
        var didCallCheckSavedLogin = false
        
        override func checkSavedLogin() {
            didCallCheckSavedLogin = true
        }
    }
    
    class LoginRouterSpy: LoginRouter{
        var didCallRouteToExtractVC = false
        
        override func routeToExtractVC(segue: UIStoryboardSegue?) {
            didCallRouteToExtractVC = true
            super.routeToExtractVC(segue: segue)
        }
    }
    
}
