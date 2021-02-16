//
//  LoginInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginInteractor {
    
    var presenter: LoginPresenterProtocol?
    var userInfo: LoginModels.LoggedinUserEntity?
    
    enum LoginError: Error, Equatable {
        case blankUsername
        case blankPassword
        case invalidUsername
        case invalidPassword(message: String)
    }
    
    
    // MARK: - Validation Methods
    
    func validateLogin(_ loginForm: LoginFormProtocol, completion: (LoginForm) -> Void, fail: (String) -> Void) {
        
        do {
            let username = try validateUsername(loginForm.username)
            let password = try validatePassword(loginForm.password)
            
            completion(LoginForm(username: username, password: password))
        }
        catch LoginError.blankUsername { fail("Username não informado") }
        catch LoginError.invalidUsername {
            fail("Username inválido.\nUsername deve ser um e-mail ou número de cpf")
        }
        catch LoginError.blankPassword { fail("Senha não informada") }
        catch LoginError.invalidPassword(let invalidPasswordMessage) {
            fail(invalidPasswordMessage)
        }
        catch { fail("Falha ao validar login") }
    }
    
    func validateUsername(_ username: String?) throws -> String {
        let username = (username ?? "").trimmingCharacters(in: .whitespaces)
        
        if username.isEmpty { throw LoginError.blankUsername }
        if validateCPF(username) != nil { return username }
        if !validateEmail(username) { throw LoginError.invalidUsername }
        
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        let password = password ?? ""
        
        if password.isEmpty { throw LoginError.blankPassword }
        
        let passwordRequirementsMessage = """
        Senha deve conter:
        ao menos um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """

        //mustIncludeUppercased: (?=.*[A-Z])
        //mustIncludeLowercased: (?=.*[a-z])
        //mustIncludeDigits: (?=.*[0-9])
        //mustIncludeSpecialCharacters: (?=.*[@#$%^&*])
        //minMaxNumCharacters: .{minNum,maxNum}
        
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[-@#$%^&*]).{3,}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        if !passwordPredicate.evaluate(with: password) { throw LoginError.invalidPassword(message: passwordRequirementsMessage) }
        
        return password
    }
    
    func validateCPF(_ username: String) -> String? {
        var validCPF = username.replacingOccurrences(of: ".", with: "")
        validCPF = validCPF.replacingOccurrences(of: "-", with: "")
        
        // Check if has 11 digits only
        guard validCPF.count == 11, validCPF.onlyNumbers.count == 11 else { return nil }
        
        // Check if digits are not all equal
        for i in 1..<validCPF.count {
            if validCPF.at(i) != validCPF.at(0) { break }
            else if i == validCPF.count - 1 { return nil }
        }
        
        var digitsArray: [Int] = validCPF.map { Int(String($0))! }
        let digit2 = digitsArray.removeLast()
        let digit1 = digitsArray.removeLast()


        // Validação 1º digito
        var multiplier = 11
        var sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        var resultDigit = sumDigits * 10 % 11
        if resultDigit >= 10 { resultDigit = 0 }

        guard resultDigit == digit1 else { return nil }


        // Validação 2º digito
        digitsArray.append(digit1)

        multiplier = 12
        sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        resultDigit = sumDigits * 10 % 11
        if resultDigit >= 10 { resultDigit = 0 }

        guard resultDigit == digit2 else { return nil }

        return validCPF
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        if !emailPredicate.evaluate(with: email) { return false }
        return true
    }
    
    
    // MARK: - Methods
    
    func requestLogin(_ loginForm: LoginForm ) {
        presenter?.startRequest()
        LoginRequester.postLogin(loginForm) { response in
            self.presenter?.finishRequest()
            
            self.manageLoginResponse(response)
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            
            self.presenter?.loginDidFail(errorMessage)
        }
    }
    
    func manageLoginResponse(_ response: LoginResponseStruct) {
        guard let userInfo = LoginModels.LoggedinUserEntity(userInfo: response.userAccount) else {
                if let errorMessage = BadRequestStruct(badRequest: response.error) {
                    self.presenter?.loginDidFail("\(errorMessage.message!) (\(errorMessage.code!))")
                }
                else { self.presenter?.loginDidFail("Falha ao fazer o login") }
                return }
        
        self.userInfo = userInfo
        self.saveUserInfoLocally(userInfo)
        self.presenter?.didLoginWithSuccess(response: LoginModels.Response(userInfo: userInfo))
    }
    
    
    func saveUserInfoLocally(_ userInfo: LoginModels.LoggedinUserEntity) {
        UserInfoLocalEntity.save(userInfo)
    }
    
    func findUserInfoSavedLocally() -> Bool {
        return UserInfoLocalEntity.fetchLast() != nil
    }
    
}


// MARK: - Access from View

extension LoginInteractor: LoginInteractorProtocol {
    func viewWillAppear() {
        presenter?.hasUserInfoSaved(findUserInfoSavedLocally())
    }
    
    func login(_ loginForm: LoginFormProtocol) {
        validateLogin(loginForm) { loginForm in
            self.requestLogin(loginForm)
        } fail: { errorMessage in
            self.presenter?.didFailToValidate(errorMessage)
        }
    }
}
