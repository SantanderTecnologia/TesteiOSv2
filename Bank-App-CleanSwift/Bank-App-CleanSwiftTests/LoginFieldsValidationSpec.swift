//
//  LoginTests.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation
import Nimble
import Quick

@testable import Bank_App_CleanSwift

class LoginFieldsValidationSpec: QuickSpec {
    var fieldsValidator: LoginFieldsValidationWorker!
            
    override func spec() {
        beforeEach {
            self.fieldsValidator = LoginFieldsValidationWorker()
        }
        
        describe("#validate") {
            context("when username and password are correct") {
                it("returns true") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_GOOD_PASSWORD))
                        .to(beTrue())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD))
                        .to(beTrue())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD))
                        .to(beTrue())
                }
            }
            
            context("when username is correct but password does not have a capitalized letter") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_UPPERCASED_LETTER))
                        .to(beFalse())
                }
            }
            
            context("when username is correct but password does not have a number") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_NUMBER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_NUMBER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_NUMBER))
                        .to(beFalse())
                }
            }
            
            context("when username is correct but password does not have a special character") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITHOUT_SPECIAL_CHARACTER))
                        .to(beFalse())
                }
            }
            
            context("when username is correct but password does not have six or more characters") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_PASSWORD_WITH_FIVE_OR_LESS_CHARACTERS))
                        .to(beFalse())
                }
            }
                        
            context("when username is correct but password does not match any predicate") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_BAD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BLANK_PASSWORD))
                        .to(beFalse())
                }
            }
            
            context("when username is correct but password is blank") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_BLANK_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BLANK_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_BLANK_PASSWORD))
                        .to(beFalse())
                }
            }
            
            context("when username is incorrect but password is correct") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BAD_EMAIL_AND_GOOD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BAD_CPF_WITH_DOTS_AND_GOOD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BAD_CPF_WITHOUT_DOTS_AND_GOOD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BLANK_USER_AND_GOOD_PASSWORD))
                        .to(beFalse())
                }
            }
            
            context("when one field is blank and other is incorrect") {
                it("returns false") {
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BLANK_USERNAME_AND_BAD_PASSWORD))
                        .to(beFalse())
                    expect(self.fieldsValidator
                            .validate(user: LoginDoubles.USER_WITH_BAD_USERNAME_AND_BLANK_PASSWORD))
                        .to(beFalse())
                }
            }
        }
    }
}
