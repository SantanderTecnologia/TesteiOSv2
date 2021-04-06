//
//  LoginDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

enum LoginDoubles {
    // MARK: - Happy path (username and password ok)
    static let USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD = User(username: "john.appleseed@accenture.com", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "15560606022", password: "Test@1")
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "155.606.060-22", password: "Test@1")
    
    // MARK: - Username ok, password without uppercased letter
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "155.606.060-22", password: "test@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "15560606022", password: "test@1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER =
        User(username: "john.appleseed@accenture.com", password: "test@1")
        
    // MARK: - Username ok, password without special character
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER =
        User(username: "155.606.060-22", password: "Testa1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER =
        User(username: "15560606022", password: "Testa1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER = User(username: "john.appleseed@accenture.com", password: "Testa1")
        
    // MARK: - Username ok, password without number
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_NUMBER =
        User(username: "155.606.060-22", password: "Test@i")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_NUMBER =
        User(username: "15560606022", password: "Test@i")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_NUMBER = User(username: "john.appleseed@accenture.com", password: "Test@i")
    
    // MARK: - Username ok, password with less than six characters
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "155.606.060-22", password: "Tes@1")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "15560606022", password: "Tes@1")
    static let USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS =
        User(username: "john.appleseed@accenture.com", password: "Tes@1")
            
    // MARK: - Username ok, password blank
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_BLANK_PASSWORD = User(username: "155.606.060-22", password: "")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BLANK_PASSWORD = User(username: "15560606022", password: "")
    static let USER_WITH_GOOD_EMAIL_AND_BLANK_PASSWORD = User(username: "john.appleseed@accenture.com", password: "")
    
    // MARK: - Username ok, password out of all predicates
    static let USER_WITH_GOOD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "155.606.060-22", password: "asdf")
    static let USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "15560606022", password: "asdf")
    static let USER_WITH_GOOD_EMAIL_AND_BAD_PASSWORD = User(username: "john@appleseed@accenture.com", password: "asdf")
        
    // MARK: - Password ok, cpf invalid
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "11111111111", password: "Test@1")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "111.111.111-11", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_GOOD_PASSWORD = User(username: "987.654.321-09", password: "Test@1")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD = User(username: "98765432109", password: "Test@1")
    
    // MARK: - Password ok, email invalid
    static let USER_WITH_BAD_EMAIL_AND_GOOD_PASSWORD = User(username: "john.appleseed", password: "Test@1")
    
    // MARK: - Password ok, username blank
    static let USER_WITH_BLANK_USER_AND_GOOD_PASSWORD = User(username: "", password: "Test@1")
    
    // MARK: - Username and password invalid
    static let USER_WITH_BAD_EMAIL_AND_BAD_PASSWORD = User(username: "john.appleseed", password: "aaa")
    static let USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "11111111111", password: "aaa")
    static let USER_WITH_BAD_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "111.111.111-11", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITH_DOTS_AND_BAD_PASSWORD = User(username: "987.654.321-09", password: "aaa")
    static let USER_WITH_RANDOM_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD = User(username: "98765432109", password: "aaa")
    
    // MARK: - Username and password blank
    static let USER_WITH_BLANK_FIELDS = User(username: "", password: "")
    
    // MARK: One invalid, one blank
    static let USER_WITH_BLANK_USERNAME_AND_BAD_PASSWORD = User(username: "", password: "aaa")
    static let USER_WITH_BAD_USERNAME_AND_BLANK_PASSWORD = User(username: "john.appleseed", password: "")
}
